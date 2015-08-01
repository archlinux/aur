# $Id$
# Maintainer: James Harvey <jamespharvey20@gmail.com>



# Upstream has extra spacing, necessary in other distributions
# If you want to remove these, uncomment (remove the # on) the line below
#_install_removed_spacing_patch=1



pkgname=bash-git-prompt
pkgver=2.3.5
pkgrel=1
pkgdesc="Informative git prompt for bash and fish"
arch=('any')
url="https://github.com/magicmonty/bash-git-prompt"
depends=('bash')
optdepends=('fish: git prompt in fish support')
makedepends=('git')
license=('custom:BSD 2 Clause (NetBSD)')
source=("git+https://github.com/magicmonty/${pkgname}"
        'bash-git-prompt.install'
        'removed_spacing.patch')
md5sums=('SKIP'
         '1e762bd413b6efdec225928da5aa6451'
         '513706d4f97f775a60325bc31574d197')
install='bash-git-prompt.install'

prepare() {
  cd ${srcdir}/${pkgname}
  git checkout tags/${pkgver} 

  if [ -n "$_install_removed_spacing_patch" ]; then
    echo "Installing removed_spacing.patch..."
    patch -p1 -i ${srcdir}/removed_spacing.patch
  else
    echo "NOT installing removed_spacing.patch..."
  fi
}

package() {
  cd ${srcdir}/${pkgname}

  install -Dm644 gitprompt.fish ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.fish
  install -Dm755 git-prompt-help.sh ${pkgdir}/usr/lib/bash-git-prompt/git-prompt-help.sh
  install -Dm755 gitprompt.sh ${pkgdir}/usr/lib/bash-git-prompt/gitprompt.sh
  install -Dm755 gitstatus.sh ${pkgdir}/usr/lib/bash-git-prompt/gitstatus.sh
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 prompt-colors.sh ${pkgdir}/usr/lib/bash-git-prompt/prompt-colors.sh
  install -Dm644 README.md ${pkgdir}/usr/lib/bash-git-prompt/README.md

  cd themes
  install -Dm644 Custom.bgptemplate ${pkgdir}/usr/lib/${pkgname}/themes/Custom.bgptemplate
  install -Dm644 Default.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Default.bgptheme
  install -Dm644 Default_NoExitState.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Default_NoExitState.bgptheme
  install -Dm644 Single_line.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line.bgptheme
  install -Dm644 Single_line_openSUSE.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Single_line_openSUSE.bgptheme
  install -Dm644 Solarized.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Solarized.bgptheme
  install -Dm644 Solarized_NoExitState.bgptheme ${pkgdir}/usr/lib/${pkgname}/themes/Solarized_NoExitState.bgptheme
}
