# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira (faidoc) <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=csd-background
_realname=cinnamon-settings-daemon
pkgver=5.0.4
pkgrel=1
pkgdesc="The Cinnamon Settings daemon (background plugin only)"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL')
depends=('cinnamon-desktop' 'colord' 'dbus-glib' 'libcanberra-pulse' 'libcups'
         'libgnomekbd' 'libgudev' 'libnotify' 'librsvg' 'libwacom' 'nss' 'polkit'
         'pulseaudio-alsa' 'upower')
optdepends=('cinnamon-translations: i18n')
makedepends=('meson' 'samurai' 'xf86-input-wacom')
conflicts=("$_realname")
options=('!emptydirs')
source=("${_realname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('861847fb238ae53fdb31c55ab7f8475f3cad9b48a5dd3611e5ea05129e16b44cc48b3ff5d38c2fdcc3669191f952bf194b6bcba80816fb4daee9e91d85b1c781')
b2sums=('459ca8b407291e7a84742b75a272a621d05ef1929ec76dd913af477629db862429165cec26a5985c75f81ce8eaddccc6b74cfa882106784bbfb40e015a21bab8')

build() {
    mkdir -p "${srcdir}"/${_realname}-${pkgver}/builddir
    cd "${srcdir}"/${_realname}-${pkgver}/builddir

    meson --prefix=/usr \
          --libexecdir="/usr/lib/${_realname}" \
          --buildtype=plain \
          -Dinstall_binfiles=false \
          ..

    samu
}

package() {
    cd "${srcdir}"/${_realname}-${pkgver}/builddir

     DESTDIR="${pkgdir}" samu install

     find "${pkgdir}" \( -type f -o -type l \) ! \( -name '*background*' -o -name '*.pc' -o -name '*.so' \) -delete
}
