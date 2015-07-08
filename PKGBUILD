# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=apacman
pkgver=1.8
pkgrel=2
pkgdesc="AUR wrapper forked from packer"
url="http://github.com/oshazard/apacman"
license="GPL"
arch=('any')
depends=('bash' 'binutils' 'ca-certificates' 'curl' 'fakeroot' 'file' 'grep' 'jshon' 'sed' 'tar' 'wget')
optdepends=('apacman-deps: Required AUR build depends' 
            'customizepkg: Tool to auto-patch AUR PKGBUILDs'
            'rsync: Built-in ABS support')
provides=('packer')
source=("https://github.com/oshazard/apacman/archive/master.tar.gz")
md5sums=('07554b821168ad5db65ad36f91937cde')
backup=('etc/apacman.conf')
install=$pkgname.install

package() {
  cd "${srcdir}/apacman-master"

  # Install script
  mkdir -p "$pkgdir/usr/bin"
  install -m755 apacman "$pkgdir/usr/bin/apacman"

  # Install default config
  mkdir -p "$pkgdir/etc"
  install -m644 apacman.conf "$pkgdir/etc/apacman.conf"

  # Install manpages
  mkdir -p ${pkgdir}/usr/share/man/man{5,8}
  install -m644 apacman.8 "$pkgdir/usr/share/man/man8/apacman.8"
  install -m644 apacman.conf.5 "$pkgdir/usr/share/man/man5/apacman.conf.5"

  # Install GPLv3
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
