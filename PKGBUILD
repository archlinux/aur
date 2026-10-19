# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=openguimo-bin
_pkgname=openguimo
# project.godot's config/version, number of commits, short commit hash (itch.io shows the hash as the version)
pkgver=0.1.0.r11.g9ddb8ff2
pkgrel=1
# The GitLab CI "linux" job that exported this build (the same file is pushed to itch.io)
_job=17143281398
_commit=${pkgver##*.g}
pkgdesc="Open-source remake of the 1997 DOS platformer GUIMO (needs your own GUIMO 2.2 data)"
arch=('x86_64')
url="https://greyxor.itch.io/openguimo"
license=('EUPL-1.2')
# The Godot export loads these at run time: OpenGL, X11, sound, udev for gamepads
depends=('glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr'
         'libxrender' 'alsa-lib' 'libpulse' 'systemd-libs')
optdepends=('wayland: native Wayland window (openguimo --display-driver wayland)'
            'libdecor: window decorations on native Wayland'
            'xdg-desktop-portal: the system file picker to choose guimo.jbc')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The game data is embedded in the executable: strip would damage it
options=('!strip' '!debug')
_repo="https://gitlab.com/greyxor/openguimo"
source=("OpenGuimo-$pkgver.x86_64::$_repo/-/jobs/$_job/artifacts/raw/build/linux/OpenGuimo.x86_64"
        "logo-$_commit.png::$_repo/-/raw/$_commit/logo.png"
        "LICENSE-$_commit::$_repo/-/raw/$_commit/LICENSE"
        'OpenGuimo.desktop')
b2sums=('0e78546f4168ee994e3bcae58933765c4f0cd60c64250b7b22361533d5443fef32f7343b65770ec08e7091e590792ebd2007a73a02ecda2268120fd9c55b8231'
        '5ae02d4569041992b707a8bef54cb58977ac5253a8e613fb33967345a842ca048893f0aa178ee706a49adf10c855ce3c82ecb0576cd3736dde6602a776406958'
        '3b8c71d743746a27548dddca03a8096118bece09d4440647ead01d0cbaef6a9cacd2e9f640d065df481ce279ae21b6e13b6bc227b0f2e4391090fb7390a29b9c'
        '65ed6cde633b7e5e1f731f3a7a9b1fdc9d18d6039289519ca31df91e65d2d8a9bc559acc6b6003d807c15929e5a49f8f860245e077c56fbe1fa8102e86844117')

package() {
  install -Dm755 "OpenGuimo-$pkgver.x86_64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 OpenGuimo.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 "logo-$_commit.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "LICENSE-$_commit" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
