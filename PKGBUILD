# Maintainer: Andrej Halveland (SnipeX_) <andrej.halv@gmail.com>

pkgname=zotify
pkgver=0.6.13
_commit=5da27d32a1f522e80a3129c61f939b1934a0824a # 0.6.13
pkgrel=1
pkgdesc="A fast and customizable music and podcast downloader."
arch=('x86_64')
url="https://zotify.xyz/zotify/zotify"
license=('custom')
depends=(
  'python'
  'python-librespot'
  'python-music-tag'
  'python-pillow'
  'python-protobuf'
  'python-tabulate'
  'python-tqdm'
  'python-ffmpy'
  'python-pwinput'
  'python-mutagen'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-wheel'
  'python-installer'
)
source=("zotify::git+https://zotify.xyz/zotify/zotify#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd zotify
  python -m build --wheel --no-isolation
}

package() {
  cd zotify
  python -m installer --destdir="${pkgdir}" dist/*.whl
  mkdir -p "${pkgdir}/usr/bin"

  cat <<EOF >"${pkgdir}/usr/bin/zotify"
#!/bin/sh
python -m zotify \$@
EOF

  chmod +x "${pkgdir}/usr/bin/zotify"
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
