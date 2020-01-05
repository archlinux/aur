# Maintainer: Alan Jenkins <alan.james.jenkins at gmail dot com>
# Maintainer: Ryan Dowling <ryan at ryandowling dot me>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=atlauncher
_upstreamname=ATLauncher
pkgrel=1
pkgver=3.3.4.1
pkgdesc="A Launcher for Minecraft which to allow you to download and install ModPacks quickly and easily."
arch=('any')
url="https://github.com/ATLauncher/ATLauncher"
license=('GPL3')
depends=('java-runtime=8' 'openal')
makedepends=('java-environment=8' 'gradle')
provides=('atlauncher')
conflicts=('atlauncher-bin')

source=("$_upstreamname-$pkgver.jar::https://github.com/ATLauncher/ATLauncher/releases/download/$pkgver/ATLauncher-$pkgver.jar"
        "atlauncher"
        "atlauncher.desktop"
        "atlauncher.png"
       )

noextract=("$_upstreamname-$pkgver.jar")

sha256sums=('d7b7155e8f6f8113534698488d0f822820ba25df4cb3f873e924490ad65932a2'
            '8d74eebf99c96ce3719147dd5d00b66c72b5336371d0dc07cd1c96f7d45688fe'
            '5f45436c96ab9830555d0f987a96fc0b1a9766d450b958aba282820ffca6cc84'
            '369c7aa4439762878fd9970c75d1312cf0cd97119c8320b732addef4a621482d')

package() {
  cd "$srcdir"

  # create folder for the main jar executable
  mkdir -p "$pkgdir/usr/share/java/atlauncher/"
  chmod -R 755 "$pkgdir/usr/share/java/atlauncher/"

  # create folder for other files
  mkdir -p "$pkgdir/usr/share/atlauncher/Downloads"
  chmod 777 "$pkgdir/usr/share/atlauncher/Downloads"

  # install shell wrapper script
  install -D -m755 "$srcdir/atlauncher" "$pkgdir/usr/bin/atlauncher"

  # install jar
  install -D -m644 "$srcdir/$_upstreamname-$pkgver.jar" "$pkgdir/usr/share/java/atlauncher/ATLauncher.jar"

  # install desktop launcher with icon
  install -D -m644 "$srcdir/atlauncher.desktop" "$pkgdir/usr/share/applications/atlauncher.desktop"
  install -D -m644 "$srcdir/atlauncher.png" "$pkgdir/usr/share/pixmaps/atlauncher.png"
}
