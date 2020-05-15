# Maintainer: GI Jack <GI_Jack@Hackermail.com>
# Upstream: Levente Polyak <anthraxx[at]archlinux[dot]org>
#
# Replacement for usbctl with some extra features, and cleanup

pkgname=usbctl-ng
_pkgname=usbctl
pkgver=2.0
pkgrel=1
pkgdesc='Linux-hardened deny_new_usb control(forked version)'
url='https://github.com/GIJack/usbctl'
arch=('any')
license=('GPLv3')
depends=('linux-hardened' 'bash' 'usbutils' 'coreutils' 'diffutils' 'procps-ng' 'grep' 'util-linux')
#checkdepends=('shellcheck')
optdepends=('sudo: elevate to root when needed')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=(${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}/${pkgver}.tar.gz
        ${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz.sig)
sha512sums=('6f4435521ce52aca0aacb3a9d18c5286a8aac80d99987a1bcdc725ef225a48d1e26c9b5918a5dfc4608aa1160f360d62b4879da3e4e7ccc425ecfb86674f565f'
            'SKIP')
b2sums=('d9a6d4322c418a7d16a30b83b82451674ad8bc422c6c667466e054d3bc5b1b0cef87a2d2f7626a93987f2fc9086ba2a5ecffd4d59a63e3d1ad172ba1e1653529'
        'SKIP')
validpgpkeys=('C974DBDCC20BE7CFD7267D8D5B5BABADF217B040') # GI_Jack

check() {
  cd ${_pkgname}-${pkgver}
  #make test
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" MANDIR=/share/man/man1 install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim:set ts=2 sw=2 et:

