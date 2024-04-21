# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Matthias Maennich < arch .at. maennich.net >
# Contributor: bruce < b_a_g99 .at. hotmail.com >
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=dropbox-cli
pkgver=2024.04.17
pkgrel=2
pkgdesc="Command line interface for Dropbox"
arch=("any")
url="https://www.dropbox.com"
license=("GPL-3.0-or-later")
makedepends=("gdk-pixbuf2")
depends=("dropbox" "python-gobject")
optdepends=("gtk3: Dropbox update GUI"
            "python-gpgme: verify binary signature")
source=("https://linux.dropbox.com/packages/nautilus-dropbox-${pkgver}.tar.bz2"
        "dropboxd-fallback.patch")
sha256sums=('a6a098cf16aa4747f40816ac793d59e37e8ae3b7080d0b30611d6c2b8663f2c1'
            '711ed63c6dfccfd05c6e9abaa291be9ac3c3909e84f788f568cb44dee2d48229')

prepare() {
  cd "nautilus-dropbox-${pkgver}"
  # Patch to point to /opt/dropbox/dropboxd in case of local user does not exist
  patch -Np1 -i "${srcdir}/dropboxd-fallback.patch"
}

build() {
  cd "nautilus-dropbox-${pkgver}"
  python3 build_dropbox.py "${pkgver}" "/usr/share/applications" < "dropbox.in" > "${pkgname}"
}

package() {
  cd "nautilus-dropbox-${pkgver}"
  install -m 755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

