# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-google-play-scraper-git
_pkgname=google_play_scraper
pkgver=r187.ce1df6d
pkgrel=1
pkgdesc="Easily crawl the Google Play Store for Python"
arch=('x86_64')
url="https://github.com/JoMingyu/google-play-scraper"
license=('MIT')
provides=('python-google-play-scraper')
conflicts=('python-google-play-scraper')
depends=(
  'python-black'
  'python-isort'
  'python-autoflake'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/JoMingyu/google-play-scraper.git")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd google-play-scraper/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd google-play-scraper
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
