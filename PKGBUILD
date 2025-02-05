# Maintainer: Xavier Góngora <ixbalanque@protonmail.ch>
pkgname=extempore-bin
_reponame=extempore
pkgver=0.8.9
pkgrel=1
pkgdesc="A cyber-physical programming environment"
arch=('x86_64')
url="https://github.com/digego/${_reponame}"
license=('LicenseRef-extempore')
groups=('pro-audio')
depends=()
provides=('extempore')
conflicts=('extempore')
source=("${url}/releases/download/v${pkgver}/${_reponame}-v${pkgver}-ubuntu-20.04.zip" LICENSE)
sha256sums=('3b6655688085c95e3365006e7e6b863088a5baabefafc38fdaff5a992b908f88'
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
