pkgname=openmohaa-bin
pkgver=0.81.1
pkgrel=1
pkgdesc="Open re-implementation of Medal of Honor: Allied Assault"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/openmoh/openmohaa"
license=('GPL')
depends=('sdl2' 'openal')
makedepends=('unzip')
sha256sums=('39129ae2d83e744732bdbf38a2c44d78cf5170a164b2f65e9656f3d9ba56d6cd'
            '71a19f353c189921a8f7a504026655f3b3623e4b6ca8bd2b4030eae7910d54c1')
sha256sums_x86_64=('7c5326c0be6ec7e7943432365b56c04f2fdd5a4d1132deebaf58b6661578708d')
sha256sums_i686=('8f62ac56612b328c05ecb8f37c7f2f192ce450e9dc2e526679a0be3699c21fd9')
sha256sums_armv7h=('461f1897fed77ede96795a288b33cd2149ac91842328321444c9812958c44a9f')
sha256sums_aarch64=('d3b7da0d9736064d3159a18f9d0f46271d99b9559966335c40632577b3d29203')
source=("openmohaa.sh" "omohaaded.sh")
source_x86_64=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-amd64.zip")
source_i686=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-i686.zip")
source_armv7h=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-armhf.zip")
source_aarch64=("$url/releases/download/v$pkgver/openmohaa-v$pkgver-linux-arm64.zip")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/games/openmohaa"
    
   #Renaming Binaries
    find "$srcdir" -type f -name "openmohaa.*" -exec bash -c 'mv "$0" "${0%.*}"' {} \;
    find "$srcdir" -type f -name "omohaaded.*" -exec bash -c 'mv "$0" "${0%.*}"' {} \;
   
   #Fixing execute permission
    find "$srcdir" -type f \( -name "openmohaa" -o -name "omohaaded" -o -name "launch_openmohaa_*" \) -exec chmod +x {} \;
    find "$srcdir" -type f \( -name "openmohaa.*" -o -name "cgame.*" -o -name "launch_openmohaa_*" -o -name "omohaaded" -o -name "openmohaa" -o -name "game.*" \) -exec cp -r {} "$pkgdir/usr/share/games/openmohaa" \;
    install -Dm755 "$srcdir/openmohaa.sh" "$pkgdir/usr/bin/openmohaa"
    install -Dm755 "$srcdir/omohaaded.sh" "$pkgdir/usr/bin/omohaaded"
}
