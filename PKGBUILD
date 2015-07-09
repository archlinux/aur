# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Otto Allmendinger <otto.allmendinger@gmail.com>

pkgname=crayonphysicsdeluxe
pkgver=55+h20120827
_hibver=55
pkgrel=1
pkgdesc="A 2D physics puzzle/sandbox game (Humble Bundle/Store version)"
arch=(i686 x86_64)
url="http://www.crayonphysics.com/"
license=("custom:commercial")
depends_i686=(glu qt4 sdl_image sdl_mixer)
depends_x86_64=(lib32-glu lib32-qt4 lib32-sdl_image lib32-sdl_mixer)
options=(!strip)
source=(hib://crayon_physics_deluxe-linux-release$_hibver.tar.gz
        crayonphysicsdeluxe.desktop
        crayon.sh)
md5sums=(3f799bba4fbca02fcee4b866e17b193d
         75e2f77781e830e4eb40b90c091dd858
         4e3c5f5fe8fe1db8e36d6a83dc30625d)
DLAGENTS+=('hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf.; exit 1')
PKGEXT=.pkg.tar

_installname=crayonphysicsdeluxe

package() {
    # launch script
    cd "$srcdir"
    install -Dm755 crayon.sh "$pkgdir"/usr/bin/crayon

    # data
    cd CrayonPhysicsDeluxe
    find data -type f -exec install -Dm644 {} "$pkgdir"/opt/$_installname/{} \;
    install -m644 autoexec.txt "$pkgdir"/opt/$_installname/autoexec.txt
    install -m755 -t "$pkgdir"/opt/$_installname crayon launcher

    # legal
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$_installname/LICENSE

    # doc
    install -Dm644 readme.html "$pkgdir"/usr/share/doc/$_installname/README.html

    # desktop integration
    install -Dm644 "$srcdir"/crayonphysicsdeluxe.desktop \
                   "$pkgdir"/usr/share/applications/kloonigames-crayon.desktop
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/kloonigames-crayon.png
}

# vim:et:sw=4:sts=4
