# Maintainer: Ilnu1123

pkgname=gl3w
pkgver=20220324
pkgrel=5
license=('Unlicense')
pkgdesc='Simple OpenGL core profile loader'
url='https://github.com/skaslev/gl3w'
arch=('any')
depends=('libglvnd' 'glu' 'python' 'python-argparse' 'python-urllib3')
source=(
    "https://raw.githubusercontent.com/skaslev/gl3w/master/gl3w_gen.py"
    "gl3w-build"
    "gl3w-update"
    "gl3w-update-pacman.hook"
)
sha256sums=(
    'SKIP'
    '065844d5ad250ddc0682156872971883926b7eaa6e524cbebeebf8732c97db20'
    'c028eabffc39c35e66bc6025252d92bad06944a8d13906b2f1efdca82b1954df'
    '505534f81fa72a7bdcaf142675bc6cbae414dd608d2b10dee16bbe145e6af6a2'

)
install='post.install'
package(){
    mkdir -p $pkgdir/usr/share/libalpm/hooks
    mkdir -p $pkgdir/usr/share/gl3w/include
    mkdir -p $pkgdir/usr/share/gl3w/src
    mkdir -p $pkgdir/usr/include/GL
    mkdir -p $pkgdir/usr/lib

    touch $pkgdir/usr/include/GL/gl3w.h
    touch $pkgdir/usr/share/gl3w/src/gl3w.c
    touch $pkgdir/usr/lib/libgl3w.so #for proper deleting
    chmod +x $pkgdir/usr/include/GL/gl3w.h
    chmod +x $pkgdir/usr/share/gl3w/src/gl3w.c
    chmod +x $pkgdir/usr/lib/libgl3w.so
    chmod +x ./gl3w_gen.py
    cp ./gl3w-update-pacman.hook $pkgdir/usr/share/libalpm/hooks
    cp ./gl3w_gen.py $pkgdir/usr/share/gl3w
    cp ./gl3w-build $pkgdir/usr/share/gl3w
    cp ./gl3w-update $pkgdir/usr/share/gl3w
    touch $pkgdir/usr/share/gl3w/not_symlinked
}
