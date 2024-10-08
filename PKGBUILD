# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-sssekai-git
pkgver=r113.661ad80
pkgrel=2
pkgdesc="About Project SEKAI Asset Utility."
arch=('x86_64')
url="https://github.com/mos9527/sssekai"
license=('MIT')
provides=('sssekai')
conflicts=('python-sssekai')
depends=(
  'python-attrs'
  'python-brotli'
  'python-certifi'
  'python-charset-normalizer'
  'python-coloredlogs'
  'python-etcpak-git'
  'python-python-ffmpeg'
  'python-fsspec'
  'python-future'
  'python-humanfriendly'
  'python-idna'
  'python-lz4'
  'python-msgpack'
  'python-pillow'
  'python-pycryptodome'
  'python-pyfmodex-git'
  'python-json-logger'
  'python-requests'
  'python-tabulate'
  'python-texture2ddecoder'
  'python-tqdm'
  'python-unitypy'
  'python-urllib3'
  'python-wannacri-git'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('git')

source=("git+https://github.com/mos9527/sssekai.git")
md5sums=('SKIP')

pkgver() {
  cd sssekai
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd sssekai
  echo -e "\e[31mNote: The test may take a long time, please be patient...\e[0m"
  pytest -v --cov || true
}

package() {
  cd sssekai
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
