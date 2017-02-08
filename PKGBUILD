# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=bats-git
pkgver=v0.4.0.r6.g0360811
pkgrel=1
pkgdesc="Bash Automated Testing System"
arch=("any")
url="https://github.com/sstephenson/bats"
license=("MIT")
depends=('bash')
makedepends=('git')
source=('git+https://github.com/sstephenson/bats.git')
md5sums=('SKIP')
conflicts=('bash-bats')

_gitname='bats'

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  #./install.sh "$pkgdir/usr"

  for fn in libexec/*; do
    install -Dm755 ${fn} \
      ${pkgdir}/usr/lib/${_gitname}/$(basename ${fn})
  done

  install -dm755 ${pkgdir}/usr/bin
  ln -s ../lib/${_gitname}/bats ${pkgdir}/usr/bin/bats
  install -Dm744 man/bats.1 "${pkgdir}/usr/share/man/man1/bats.1"
  install -Dm744 man/bats.7 "${pkgdir}/usr/share/man/man7/bats.7"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
