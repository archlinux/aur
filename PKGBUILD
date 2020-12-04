# Maintainer: Cranky Supertoon <crankysupertoon at gmail dot com>
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=modsman
pkgver=0.32.1
pkgrel=4
arch=('x86_64')
pkgdesc="Minecraft mod manager and updater for the CLI"
url='https://github.com/sargunv/modsman'
license=('GPL3')
makedepends=('gendesk' 'git' 'java-environment=8')
depends=('java-runtime=8')
source=("$pkgname::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk ./gradlew :$pkgname-cli:installDist --info --stacktrace
}

package() {
    # remove windows command
    rm "$srcdir/$pkgname/$pkgname-cli/build/install/$pkgname-cli/bin/$pkgname-cli.bat"
    # create installation directory
    mkdir -p $pkgdir/opt/
    cp -r "$srcdir/$pkgname/$pkgname-cli/build/install/$pkgname-cli/" $pkgdir/opt/$pkgname
    # create symbolic link to command
    mkdir -p $pkgdir/usr/bin/
    ln -s ../../opt/$pkgname/bin/$pkgname-cli $pkgdir/usr/bin/$pkgname
}
