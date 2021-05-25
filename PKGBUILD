# Maintainer: Maël <alemswaj+tutanota+com>

pkgname=airdroid-nativefier
pkgver=1
pkgrel=1
pkgdesc="An Airdroid client build with nativefier"
arch=(any)
url="https://web.airdroid.com/"
license=(GPL3)
depends=()
makedepends=("nodejs-nativefier")
conflicts=()
install=airdroid.install
source=(${pkgname}.desktop
	https://icons.iconarchive.com/icons/martz90/hex/512/airdroid-icon.png
)
sha256sums=("889a3a3b222b5fe5972a1f94952ff8166c7da2e49735da9e45595a4657af65d8"
	    "7553963eefedbdc88c9d973c0ffe8922a25b0cc2a13284b2b1b7ebb25af7bc10"
)

build() {
	cd "$srcbuild"
	
	nativefier \
                              --name "Airdroid" \
                              --width "800px" \
                              --height "600px" \
                              --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
                              --verbose \
                              --single-instance \
                              "https://web.airdroid.com/"

}

package() {
	cd "$srcbuild"
	mv */ Airdroid/
	mkdir bin/
	touch bin/airdroid
	echo "#!/bin/sh" > bin/airdroid
	sed -i '1a /opt/Airdroid/Airdroid' bin/airdroid
	chmod +x bin/airdroid
	chmod ugo+x Airdroid/Airdroid
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/{Airdroid,chrome-sandbox}
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/{chrome_100_percent,chrome_200_percent,resources}.pak
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/{libEGL,libffmpeg,libGLESv2,libvk_swiftshader}.so
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/icudtl.dat
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/{snapshot_blob,v8_context_snapshot}.bin
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/libvulkan.so.1
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/{LICENSE,version}
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/LICENSES.chromium.html
	install -Dm644  -t "$pkgdir"/opt/Airdroid Airdroid/vk_swiftshader_icd.json
   	install -Dm644  -t "$pkgdir"/opt/Airdroid/locales Airdroid/locales/*
   	install -Dm644  -t "$pkgdir"/opt/Airdroid/resources/app Airdroid/resources/app/{nativefier,package}.json
   	install -Dm644  -t "$pkgdir"/opt/Airdroid/resources/app/inject Airdroid/resources/app/inject/_placeholder
   	install -Dm644  -t "$pkgdir"/opt/Airdroid/resources/app/lib Airdroid/resources/app/lib/{main,preload}.js
   	install -Dm644  -t "$pkgdir"/opt/Airdroid/resources/app/lib Airdroid/resources/app/lib/{main.js,preload.js}.map
   	install -Dm644  -t "$pkgdir"/opt/Airdroid/resources/app/lib/static Airdroid/resources/app/lib/static/*
 	install -D	-t "$pkgdir"/usr/bin bin/airdroid
 	install -D	-t "$pkgdir"/usr/share/applications airdroid-nativefier.desktop
 	install -D 	-t "$pkgdir"/usr/share/icons/hicolor/512x512/apps airdroid-icon.png
}

