# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=palemoon-deb-gtk3-bin
pkgver=32.4.0.1
pkgrel=1
pkgdesc="An Open Source, Goanna-based web browser focusing on efficiency and customization."
arch=("x86_64" "i686" "aarch64")
url="http://www.palemoon.org/"
license=("MPL2" "LGPL2.1" "LGPL3" "GPL3")
provides=("${pkgname%-deb-gtk3-bin}")
conflicts=("${pkgname%-deb-gtk3-bin}")
depends=('gtk3' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib' 'startup-notification' 'unzip' 'zip' 'yasm' 'libpulse' 'gcc' 'openssl-1.1')
makedepends=('xz')
source=("https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/i386/palemoon_${pkgver}-${pkgrel}.gtk3_i386.deb"
        "https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/amd64/palemoon_${pkgver}-${pkgrel}.gtk3_amd64.deb"
        "https://download.opensuse.org/repositories/home:/stevenpusser:/${pkgname%-deb-gtk3-bin}-GTK3/Debian_12/arm64/palemoon_${pkgver}-${pkgrel}.gtk3_arm64.deb"
        "https://repo.palemoon.org/MoonchildProductions/Pale-Moon/src/branch/master/palemoon/branding/official/palemoon.desktop")

options=("!strip")
sha256sums=('62938ed46eb79f2203342f5ee610761ec0514827263245a5b30a120a86662ecd'
            'b4bd6dcfc29d04160e830facb3512381451f11ea1f99c86f7b094bd0fefca434'
            '1ffc9744b30ec0948831c1bf37ea22e0f916e103860c4d213cac24ffb166903b'
            SKIP)

prepare() {
  cd "${srcdir}"
  if [ "${arch}" = "x86_64" ]; then
    ar x palemoon_${pkgver}-${pkgrel}.gtk3_amd64.deb
  elif [ "${arch}" = "i686" ]; then
    ar x palemoon_${pkgver}-${pkgrel}.gtk3_i386.deb
  elif [ "${arch}" = "aarch64" ]; then
    ar x palemoon_${pkgver}-${pkgrel}.gtk3_arm64.deb
  else
    echo "Invalid arch ${arch}."
    exit 1
  fi
}

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -Dm644 "${srcdir}/palemoon.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
