# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=psy-ex-metrics
pkgname=$_pkgname-git
pkgver=c44.f4b9886
pkgrel=1
pkgdesc='Perceptual video metrics toolkit'
arch=(x86_64)
url=https://github.com/psy-ex/metrics
license=(Apache-2.0)
depends=(
  uv
  ffmpeg
  vapoursynth
  ffms2
  vapoursynth-plugin-vszip
  vapoursynth-plugin-julek
)
makedepends=(
  git
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  echo c$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_pkgname
  install -Dm644 scripts/metrics.py "$pkgdir/usr/bin/metrics.py"
  install -Dvm755 scripts/encode.py "$pkgdir/usr/bin/psy-ex-encode.py"
  install -Dvm755 scripts/plot.py "$pkgdir/usr/bin/psy-ex-plot.py"
  install -Dvm755 scripts/scores.py "$pkgdir/usr/bin/psy-ex-scores.py"
  install -Dvm755 scripts/stats.py "$pkgdir/usr/bin/psy-ex-stats.py"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
