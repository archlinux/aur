# Maintainer: ictye <northgreen2006 at qq dot com>
pkgname=ez2lazer-git
url='https://github.com/SK-la/Ez2Lazer'
pkgrel=1
pkgver=2026.4.23.r25.g31975a043e
pkgdesc='Ez to Lazer(Pursue the Ez2Ac style in the lazer)做一个炫酷的客户端'
arch=("x86_64")
license=("MIT")
depends=(
    'ffmpeg4.4'
    'lttng-ust2.12')
makedepends=(
    'dotnet-sdk-8.0'
    'git'
    'python')
source=(
    'osu::git+https://github.com/SK-la/Ez2Lazer.git#branch=master'
    'osu-framework::git+https://github.com/SK-la/osu-framework.git#branch=master'
    'osu-resources::git+https://github.com/SK-la/osu-resources.git#branch=master'
    'osu-ez2lazer'
    'osu-ez2lazer.desktop'
    'lazer.png')

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a3f9ed38e65e5ce1b89c7df53d4139ade3af7eb0e379ef61a2a69a128d8bcbde'
            '17a504de02a94727584e77c90d93b6bf072dd40f339e05fb2df038f67d9a9d6d'
            '30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51')

pkgver() {
    cd osu
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    chmod +x $srcdir/osu/publish-linux.py
    $srcdir/osu/publish-linux.py --no-zip --outroot $srcdir
}

package() {
    mkdir -p "$pkgdir"/opt/osu-ez2lazer
    cp -dr --no-preserve=ownership "$srcdir"/artifacts/Ez2Lazer_release_linux_x64/* "$pkgdir"/opt/osu-ez2lazer
    install -D -m755 osu-ez2lazer "$pkgdir"/usr/bin/osu-ez2lazer

    install -D -m644 osu-ez2lazer.desktop "$pkgdir"/usr/share/applications/osu-ez2lazer.desktop
    install -D -m644 lazer.png "$pkgdir"/usr/share/pixmaps/ez2lazer.png
    install -Dm644 "$srcdir/osu/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
