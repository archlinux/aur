# Maintainer: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Clément DÉMOULINS <clement AT archivel DOT fr>

pkgname=gnome-ssh-askpass3
_pkgbase=openssh
pkgver=8.6p1
pkgrel=1
pkgdesc='A GTK3 passphrase requester for ssh-add.'
arch=('x86_64')
url="https://www.openssh.com/portable.html"
license=('custom:2-term BSD licence')
depends=('gtk3')
provides=('x11-ssh-askpass')
conflicts=('x11-ssh-askpass' 'ssh-askpass-fullscreen' 'gnome-ssh-askpass' 'gnome-ssh-askpass2')

source=(https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgbase}-${pkgver}.tar.gz
        ${pkgname}.sh)
sha256sums=('c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae'
            '8a18ef3a2c6e61f117db49aabef4e191fea47df43907872113fd64536d2f4c11')

build() {
  cd "${_pkgbase}-${pkgver}/contrib"

  make ${pkgname}
}

package() {
  cd "${_pkgbase}-${pkgver}/contrib"

  install -D -m 755 ${pkgname} "${pkgdir}/usr/lib/ssh/${pkgname}"
  install -D -m 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -D -m 644 ../LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
