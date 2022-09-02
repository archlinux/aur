# Maintainer: timescam <timescam at duck dot com>

_pkgname=via
pkgname=$_pkgname-bin
pkgver=2.0.5
pkgrel=2
pkgdesc="binary distribution of electron builds for https://usevia.app/"
arch=(any)
url="https://caniuse$_pkgname.com/"
provides=("${_pkgname}=${pkgver}")
depends=("gtk3" 
        "libnotify"
        "nss"
        "libxss"
        "libxtst"
        "xdg-utils" 
        "at-spi2-core"
        "libutil-linux"
        "libsecret")
optdepends=("libappindicator-gtk3: recommended for app indicator")
_filename=("${_pkgname}-${pkgver}-linux.deb")
source=("https://github.com/the-$_pkgname/releases/releases/download/v${pkgver}/$_filename")

md5sums=("a48528b45af5792c5d7f26f8f0f24879")

build() {
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cp -r "${srcdir}/output/"* "${pkgdir}"
  install -d "${pkgdir}"/usr/bin
  ln -s /opt/VIA/via-nativia "${pkgdir}"/usr/bin/via
}
