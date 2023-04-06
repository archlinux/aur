# Maintainer: Charles Leclerc <charles@la-mouette.net>
# Co-Maintainer: Polarian <polarian@polarian.dev>

pkgname=reposilite
<<<<<<< HEAD
pkgver=3.4.3
pkgrel=2
pkgdesc="Reposilite (formerly NanoMaven) - lightweight repository manager for Maven artifacts. It is a simple solution to replace managers like Nexus, Archiva or Artifactory."
arch=(any)
url="https://reposilite.com"
license=('Apache')
depends=('java-runtime-headless')
source=("https://maven.reposilite.com/releases/com/reposilite/$pkgname/$pkgver/$pkgname-$pkgver-all.jar"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.env"
        "$pkgname.wrapper")
sha256sums=('e18f7b9da3207db7c938580ce8121c773aa4bf8a4734a2fa5a1a964e5eac8d7e'
            '1e543e7ef39d64ae683156aaa6aad8f164f30de999d15717416410e1750b9a8e'
            '92ccfeff429aa4757ef353677dd99ad7aebe7483d4824706a27250e81efd6323'
            '9587fa49dd66d5f31dee33aa1a9da269a34666b63f62e2550a66c3bc1d397aa7'
            '7869b2925d6d2a897148b282af02992d7b4c5cfb6e7f01f0a277633689614c11'
            '2f7cd3fdada1ba51da3259a2ad7ef6bbdbb5fea5023c8fcc78d4d5c19ff569d3')
backup=('etc/reposilite/configuration.cdn'
        'etc/reposilite/default.env')

package() {
  install -Dm 644 $pkgname.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 $pkgname.sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 $pkgname.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm 644 "$pkgname-$pkgver-all.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm 644 $pkgname.env "${pkgdir}/etc/reposilite/default.env"
  java -jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar" -wd "${pkgdir}/etc/reposilite" -gc configuration.cdn
  install -Dm 755 $pkgname.wrapper "${pkgdir}/usr/bin/reposilite"
}
