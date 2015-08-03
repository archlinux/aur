# $Id$
# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=bash-git-prompt-git
_pkgname=bash-git-prompt
pkgver=2.3.5.r249.2a6b20c
pkgrel=2
pkgdesc="Informative git prompt for bash and fish (git version)"
arch=('any')
url="https://github.com/magicmonty/bash-git-prompt"
depends=('bash')
optdepends=('fish: git prompt in fish support')
makedepends=('git')
provides=('bash-git-prompt')
conflicts=('bash-git-prompt')
license=('custom:BSD 2 Clause (NetBSD)')
source=("git+https://github.com/magicmonty/${_pkgname}"
        'bash-git-prompt.install'
        'Default_Arch.bgptheme')
md5sums=('SKIP'
         'db6f83999124b7fa660310a8d6624f70'
         '879555792d1b4c0ddef7cd81b0a3e35c')
install='bash-git-prompt.install'

pkgrel() {
  echo $(cat bash-git-prompt.rb | grep url | sed 's|.*archive/||' | sed 's|.tar.gz"$||').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd ${srcdir}/${_pkgname}

  install -Dm644 gitprompt.fish ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.fish
  install -Dm755 git-prompt-help.sh ${pkgdir}/usr/lib/bash-git-prompt/git-prompt-help.sh
  install -Dm755 gitprompt.sh ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.sh
  install -Dm755 gitstatus.sh ${pkgdir}/usr/lib/bash-git-prompt/gitstatus.sh
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 prompt-colors.sh ${pkgdir}/usr/lib/bash-git-prompt/prompt-colors.sh
  install -Dm644 README.md ${pkgdir}/usr/lib/bash-git-prompt/README.md

  cd themes
  install -Dm644 Custom.bgptemplate ${pkgdir}/usr/lib/${_pkgname}/themes/Custom.bgptemplate
  install -Dm644 Default.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Default.bgptheme
  install -Dm644 ${srcdir}/Default_Arch.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Default_Arch.bgptheme
  install -Dm644 Default_NoExitState.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Default_NoExitState.bgptheme
  install -Dm644 Single_line.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Single_line.bgptheme
  install -Dm644 Single_line_openSUSE.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Single_line_openSUSE.bgptheme
  install -Dm644 Solarized.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Solarized.bgptheme
  install -Dm644 Solarized_NoExitState.bgptheme ${pkgdir}/usr/lib/${_pkgname}/themes/Solarized_NoExitState.bgptheme
}
