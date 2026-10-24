# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=IngeTrazo
pkgname=ingetrazo
pkgver=0.5.9
pkgrel=0
url="https://$pkgname.com"
_url="https://github.com/ingelibre/$pkgname"
pkgdesc='vibe coded clean-room reimplementation of Trimble Sketchup'
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
         hicolor-icon-theme
         python
         pyside6
         # python-ezdxf
         python-numpy
         python-manifold3d
         # python-openskp
         libgcc)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('68adc0b232aec2827512c7304f1a46123a1dc01e9102f32b56decfc9c60a6a9a')

_icons=(512 256 128 64 48 32 24 16)

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
        # python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/flatpak/com.$pkgname.$_pkgname.desktop"
	for s in ${_icons[@]}; do
		local dim="${s}x${s}"
		install -Dm0644 resources/icons/hicolor/$pkgname_$s.png "$pkgdir/usr/share/icons/hicolor/$dim/apps/$pkgname.png"
	done
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
