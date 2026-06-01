# Maintainer: Xavier Góngora <ixbalanque at protonmail dot ch>

_appname=extempore
pkgname=$_appname-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="A cyber-physical programming environment"
arch=('x86_64')
url="https://github.com/digego/${_appname}"
license=('LicenseRef-extempore')
groups=('pro-audio')
depends=()
provides=('extempore')
conflicts=('extempore')
source=("${url}/releases/download/v${pkgver}/${_appname}-linux-${arch}-v${pkgver}.zip" LICENSE)
sha256sums=('2800a610c92477c86c6995e05f4586ea5f265b950f895219f7fcc72527144dad'
  'f4bd232731cf4d4ddc82026b26a6e08736c2f5e8770078f69a864d9a45bec070')

package() {
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # NOTE: the source archive just contains a directory called "extempore"
  install -d "$pkgdir/opt/${_reponame}"
  cp -a "${srcdir}/${_reponame}/." "$pkgdir/opt/${_reponame}/"

  # Wrapper script for changing working directory to resolve the relative paths
  # of the included runtime dependencies
  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/extempore" <<EOF
#!/bin/sh
cd /opt/extempore && exec ./extempore "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/extempore"
}
