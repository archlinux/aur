# Author: Robert Tari <robert at tari dot in>
# Maintainer: Robert Tari <robert at tari dot in>
# Maintainer: Ingo Meyer <IJ_M@gmx.de>

pkgname="ayatana-webmail-no-indicator-messages"
pkgver="22.12.15"
pkgrel="1"
pkgdesc="Webmail notifications and actions for any desktop without ayatana-indicator-messages dependency"
arch=("any")
url="https://tari.in/www/software/ayatana-webmail/"
license=("GPL3")
depends=("hicolor-icon-theme" "dconf" "gobject-introspection" "desktop-file-utils" "libnotify" "libcanberra" "gnome-keyring" "python-babel" "python-gobject" "python-psutil" "python-secretstorage" "python-urllib3")
makedepends=("python-setuptools" "python-polib")
optdepends=("ayatana-indicator-messages: Support for indicator messages")
install="ayatana-webmail.install"
source=("ayatana-webmail-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/ayatana-webmail/archive/${pkgver}.tar.gz"
        "status_icon.patch")
md5sums=("2703acd3381d466e042eee64d109ad51"
         "eb8721b75b144ab35a8e18bb352799ab")
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
