# Maintainer: Christopher Fair  <christopherpfair at comcast dot net>
pkgname=git-subrepo
pkgver=0.4.1
pkgrel=3
pkgdesc="Git Submodule Alternative"
arch=('i686' 'x86_64')
url="https://github.com/ingydotnet/git-subrepo.git"
license=('MIT')
depends=('git')
makedepends=('git')
source=("https://github.com/ingydotnet/git-subrepo/archive/${pkgver}.tar.gz")
sha256sums=('64cc2490c54fe1e5396bb14f6bbf0aa8378085f3b8847fd8ed171e5ddd886065')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # git-subrepo
  install -d "${pkgdir}/usr/lib/git-core/"
  make INSTALL_LIB="${pkgdir}/usr/lib/git-core" PREFIX=$"${pkgdir}/usr" install

  # Completions Bash and ZSH /!\ DOESN'T WORK /!\
  install -D -m0644 "share/completion.bash" \
	  "${pkgdir}/usr/share/bash-completion/completions/git-subrepo"
  install -D -m0644 "share/zsh-completion/_git-subrepo" \
	  "${pkgdir}/usr/share/zsh/site-functions/_git-subrepo"

  # License
  install -D -m644 License "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

