# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>
# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="ayatana-webmail-no-indicator-messages"
pkgver="26.6.13"
pkgrel="1"
pkgdesc="Webmail notifications and actions for any desktop without ayatana-indicator-messages dependency"
arch=("any")
url="https://tari.in/www/software/ayatana-webmail/"
license=("GPL3")
depends=("hicolor-icon-theme" "dconf" "gobject-introspection" "desktop-file-utils" "libnotify" "libcanberra" "gnome-keyring" "python-babel" "python-gobject" "python-psutil" "python-secretstorage" "python-urllib3" "gsettings-desktop-schemas")
makedepends=("python-setuptools" "python-polib")
optdepends=("ayatana-indicator-messages: Support for indicator messages")
install="ayatana-webmail.install"
source=("ayatana-webmail-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/ayatana-webmail/archive/${pkgver}.tar.gz"
        "status_icon.patch")
sha256sums=("282bdeb40ff81a55c60143164770e387a3931b5693ba27a3cda49932d3e4e86f"
            "82db94477732a2df2ad5125b6a09c4349fc0d047eb5ad164ff536748d7ac02e4")
provides=("ayatana-webmail=${pkgver}")
replaces=("unity-mail")
conflicts=("ayatana-webmail" "unity-mail")

prepare()
{
    cd ayatana-webmail-${pkgver}
    patch -Np1 -i "${srcdir}/status_icon.patch"
}

build()
{
    cd ayatana-webmail-${pkgver}
    python setup.py build
}

package()
{
    cd ayatana-webmail-${pkgver}
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
