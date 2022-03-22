# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: max-k <max-kATpostDOTcom>

pkgname=sonar-scanner
pkgver=4.7.0.2747
pkgrel=1
pkgdesc='Generic CLI tool to launch project analysis on SonarQube servers'
arch=('any')
url='https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/'
license=('LGPL3')
depends=('java-runtime' 'sh')
provides=('sonar-runner' 'sonar-scanner-cli')
backup=("opt/$pkgname/conf/$pkgname.properties")
install="$pkgname.install"
source=("https://binaries.sonarsource.com/Distribution/$pkgname-cli/$pkgname-cli-$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.install")
sha256sums=('8e116018669ac97cab0555d17145f6de9f0d8ab7a2521b378a19388d0625ec55'
            '70e67c19cc976f68c28b169647d335cbd803007279ff1c9e84b20ab0ac78d89f'
            '61f04a4f7771fe95e7f0a993d45002855a4c526cfaa3203845b922045c4ea5cf')

package() {
    install -Dm755 --target-directory="$pkgdir/etc/profile.d/" "$pkgname.sh"

    cd "$pkgname-$pkgver"
    install -Dm755 --target-directory="$pkgdir/opt/$pkgname/bin/" "bin/$pkgname"
    install -Dm644 --target-directory="$pkgdir/opt/$pkgname/lib/" "lib/$pkgname-cli-$pkgver.jar"
    install -Dm644 --target-directory="$pkgdir/opt/$pkgname/conf/" "conf/sonar-scanner.properties"
    ln -sf "/opt/$pkgname/conf" "$pkgdir/etc/$pkgname"
}
