# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=headlamp
pkgname=headlamp-bin
pkgver=0.38.0
pkgrel=1
pkgdesc='A Kubernetes web UI that is fully-featured, user-friendly and extensible'
arch=('x86_64')
license=('Apache-2.0')
url='https://headlamp.dev/'
depends=('gtk3' 'libxss' 'nss')
provides=('headlamp')
conflicts=('headlamp')
options=('!debug' '!strip' '!emptydirs')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/headlamp-k8s/headlamp/releases/download/v${pkgver}/Headlamp-${pkgver}-linux-x64.tar.gz"
        ${_pkgname}.svg::"https://raw.githubusercontent.com/headlamp-k8s/headlamp/main/frontend/src/resources/icon-dark.svg"
        "${_pkgname}.desktop")
b2sums=('75046d2512f15acf9bdca8bad4c78b57cf44a516d413ebbb3ff12626683cef1ca31b805bb0ae0f9d70c16b451f9b334c543a71f3e8c980a03a6117ad6f1304a8'
        '60dfacf0a97e0a642a25ca38e54a0c9448598ad0d9f40afe0966029536c40d502940068a1029463ce63df9e5216d4eba7fbd75538cedfdfd10f4014b8673a5bb'
        '775b6f07693b57548517b7e2f5cbf576daac8cc4ab744289ae2d8bb986d3609f8c5330776603fbf140a264bb31d3bba2dff3db5435aef22f9ddcabddc25c2853')

package() {
  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${_pkgname}
  mv "${srcdir}"/Headlamp-${pkgver}-linux-x64/* \
    "${pkgdir}"/usr/share/${_pkgname}

  # icon
  install -Dm 644 ${_pkgname}.svg \
    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg

  # desktop file
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/${_pkgname} \
    "${pkgdir}"/usr/bin/${_pkgname}

  # clean and fix permissions
  chmod -x "${pkgdir}"/usr/share/${_pkgname}/*.so
}
