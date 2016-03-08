# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=apacman
pkgver=2.5
pkgrel=1
pkgdesc="AUR wrapper forked from packer"
url="http://github.com/oshazard/apacman"
license=('GPL')
arch=('any')
depends=('bash' 'binutils' 'ca-certificates' 'curl' 'fakeroot' 'file' 'grep' 'jshon' 'sed' 'tar' 'wget')
optdepends=('apacman-deps: Required AUR build depends' 
            'apacman-utils: Useful AUR tools'
            'customizepkg: Tool to auto-patch AUR PKGBUILDs'
            'man: Debug network errors'
            'rsync: Built-in ABS support')
provides=('packer')
source=("https://github.com/oshazard/apacman/releases/download/v${pkgver}/apacman-${pkgver}.tar.gz")
md5sums=('c7cd1009ec4ef61b007d9c34342e1753')
backup=('etc/apacman.conf')
install=$pkgname.install

package() {
  cd "${srcdir}/apacman-${pkgver}"

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

  # Install tab completion
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  install -m644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_apacman"
}
