pkgbase=fuse-3ds
pkgname=(fuse-3ds fuse-3ds-gui)
pkgver=1.3
pkgrel=2
pkgdesc="FUSE Filesystem Python scripts for Nintendo 3DS files"
arch=($CARCH)
license=(MIT)
url='https://github.com/ihaveamac/fuse-3ds'
makedepends=('python-setuptools' 'python-pycryptodomex')
options=(!strip)
source=("fuse-3ds-${pkgver}-src.zip::https://github.com/ihaveamac/fuse-3ds/releases/download/v${pkgver}/fuse-3ds-${pkgver}-src.zip"
	'fuse3ds.desktop'
	'https://raw.githubusercontent.com/ihaveamac/fuse-3ds/cbbd3fbd1a5524ebdc9264bdb24c72f70bc9a85c/fuse3ds/data/16x16.png'
	'https://raw.githubusercontent.com/ihaveamac/fuse-3ds/cbbd3fbd1a5524ebdc9264bdb24c72f70bc9a85c/fuse3ds/data/32x32.png'
	'https://raw.githubusercontent.com/ihaveamac/fuse-3ds/cbbd3fbd1a5524ebdc9264bdb24c72f70bc9a85c/fuse3ds/data/64x64.png'
	'https://raw.githubusercontent.com/ihaveamac/fuse-3ds/cbbd3fbd1a5524ebdc9264bdb24c72f70bc9a85c/fuse3ds/data/128x128.png'
	'https://raw.githubusercontent.com/ihaveamac/fuse-3ds/cbbd3fbd1a5524ebdc9264bdb24c72f70bc9a85c/fuse3ds/data/1024x1024.png')
sha256sums=('796bd5581a17985d48b5afc8f5074200b3eff1ba28218b403d36bc3a94a80111'
	'0019bc6ee6bb74a3b6a19db56973dea86abeb17612c515ea83d7f143f3885f90'
	'a5e4a01dbcd71c4430beb078918595c0715125effb98293bb67d32377389b01a'
	'7e108b969a0b143fc378bdee5dfe24a401f4e0962426e25ed0d30a8afd0eb0fd'
	'28f72bc37cae618d1ae249cd5db2d0c2cbdc88a67b61d19bfddb01944898f13d'
	'23443b4f76c6a8cab7ba1f9f9d7281ddb4c1059cf646d2c4f274a965fe86357a'
	'dc22a4a371ddc5282ce65f07bba76e571b14ce82b28874aa848d398ab9dce263')
noextract=('fuse-3ds-${pkgver}-src.zip')

build() {
	unzip "${srcdir}/fuse-3ds-${pkgver}-src.zip" -d "${srcdir}/fuse-3ds"
	cd "${srcdir}/fuse-3ds"
	python setup.py build
}

package_fuse-3ds() {
	depends=("python>=3.6.1" "python-pycryptodomex" "fuse2")
	cd "${srcdir}/fuse-3ds"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm "$pkgdir/usr/bin/fuse3ds"
	rm -rf "$pkgdir/usr/share"
}

package_fuse-3ds-gui() {
	depends=("fuse-3ds=$pkgver-$pkgrel" "python-appjar")
	cd "${srcdir}/fuse-3ds"
	install="Fuse3DSGUI.install"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	rm "$pkgdir/usr/bin/mount_"*
	rm -r "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/fuse3ds.desktop" "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps"
	cp "$srcdir/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/fuse3ds.png"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
	cp "$srcdir/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/fuse3ds.png"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
	cp "$srcdir/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/fuse3ds.png"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	cp "$srcdir/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/fuse3ds.png"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/1024x1024/apps"
	cp "$srcdir/1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/fuse3ds.png"
}
