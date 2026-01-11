_idaplugin=pyclassinformer
pkgname=ida-pro-plugin-$_idaplugin-git
pkgver=0.0.r41.6bcbbc3
pkgrel=1
pkgdesc="IDA Pro plugin: Yet Another RTTI Parsing IDA plugin"
url="https://github.com/herosi/PyClassInformer"
depends=()
makedepends=()
license=(custom)
arch=(any)
source=("$_idaplugin::git+${url}.git")
sha256sums=(SKIP)

IDADIR=${IDADIR:-/opt/ida-pro}

pkgver() {
	cd "$_idaplugin"
    echo "0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -Dm644 "$_idaplugin"/ida-plugin.json -t "$pkgdir$IDADIR"/plugins/$_idaplugin/
	install -Dm644 "$_idaplugin"/pyclassinformer_plugin.py -t "$pkgdir$IDADIR"/plugins/$_idaplugin/
	cp -r "$_idaplugin"/pyclassinformer "$pkgdir$IDADIR"/plugins/$_idaplugin/

	install -Dm644 "$_idaplugin"/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/

	install -Dm644 "$_idaplugin"/README.md -t "$pkgdir"/usr/share/doc/$pkgname/
    cp -r "$_idaplugin"/images "$pkgdir"/usr/share/doc/$pkgname/
}
