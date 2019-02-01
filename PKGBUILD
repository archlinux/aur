# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=openapi-generator-cli
pkgver=4.0.0beta2
_tag=4.0.0-beta2
pkgrel=1
pkgdesc="OpenAPI Generator CLI + bash completion"
arch=('any')
url="https://openapi-generator.tech/"
license=('Apache')
source=("http://central.maven.org/maven2/org/openapitools/$pkgname/$_tag/$pkgname-$_tag.jar"
        "https://raw.githubusercontent.com/OpenAPITools/openapi-generator/v$_tag/scripts/openapi-generator-cli-completion.bash"
        "openapi-generator-cli")
noextract=("$pkgname-$_tag.jar")
md5sums=('e92b03b030ab0fb9bd5a65321c165655'
         '64934ddd97afb1b86640ed77f5683a93'
         '9c6bf97fc32c0b8e289068d81cf96b33')

package() {
	depends=('java-runtime' 'bash')

	install -Dm755 openapi-generator-cli "$pkgdir/usr/bin/openapi-generator-cli"
	install -Dm644 openapi-generator-cli-completion.bash "$pkgdir/etc/bash_completion.d/openapi-generator-cli"
	install -Dm644 $pkgname-$_tag.jar "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"

        sed -i -e "s/\$pkgname/$pkgname/g" "$pkgdir/usr/bin/openapi-generator-cli"
        sed -i -e "s/\$pkgver/$pkgver/g" "$pkgdir/usr/bin/openapi-generator-cli"
}
