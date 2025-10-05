# Contributor: Sergio Tridente <tioduke (at) gmail (dot) com>

pkgname=quartz
pkgver=2.5.0
pkgrel=1
pkgdesc="A richly featured, open source job scheduling library that can be integrated within virtually any Java application"
arch=('any')
url="http://www.quartz-scheduler.org/"
license=('APACHE')
depends=('java-environment>=8' 'log4j' 'slf4j')
options=(!strip)
source=(https://github.com/quartz-scheduler/quartz/releases/download/v$pkgver/quartz-$pkgver.jar
        https://github.com/quartz-scheduler/quartz/releases/download/v$pkgver/quartz-$pkgver-javadoc.jar
        https://github.com/quartz-scheduler/quartz/releases/download/v$pkgver/quartz-jobs-$pkgver.jar
        https://github.com/quartz-scheduler/quartz/releases/download/v$pkgver/quartz-jobs-$pkgver-javadoc.jar)
sha256sums=('eef3c9198e3f346ea1da386a0b940ed43d7904cf217ecc5755fbe7f4729f0804'
            '12377356d342708d567453e64986313ce2981f2b93ed469ea15900b582c5bb91'
            'ac17218d7d6854cdbc0cf832e712a2595a70e90c3c3b87433c3cf29c7da27e5b'
            'c645893ec1cc8ceef78fcc024637b954c4b788b0dabf0432b21c7ca092f804f4')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/java/$pkgname/

  for i in quartz-$pkgver.jar quartz-$pkgver-javadoc.jar quartz-jobs-$pkgver.jar quartz-jobs-$pkgver-javadoc.jar; do
     install -m644 $i "$pkgdir"/usr/share/java/quartz/
  done

  cd "$pkgdir"/usr/share/java/quartz/
  ln -s quartz-$pkgver.jar quartz.jar
  ln -s quartz-$pkgver-javadoc.jar quartz-javadoc.jar
  ln -s quartz-jobs-$pkgver.jar quartz-jobs.jar
  ln -s quartz-jobs-$pkgver-javadoc.jar quartz-jobs-javadoc.jar
}
