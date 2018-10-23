# Contributor: Daniel Miranda (dmiranda)
# Maintainer: Gustavo Costa (gusbemacbe)

_gitname=suru-plus
pkgname=suru-plus-git
pkgver=20.3.0
pkgrel=1
pkgdesc="Suru++ 20 — A cyberpunk, elegant, futuirtisc and modern third-party icons theme!"
arch=('any')
url="https://github.com/gusbemacbe/${_gitname}"
license=('GPL3')
makedepends=('git')
options=('!strip')
conflicts=(${_gitname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() 
{
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() 
{
    # Installing the icons theme
    install -d ${pkgdir}/usr/share/icons

    # Copying to the /usr/ahre/icons/
    cp -r ${srcdir}/${_gitname}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;

    # Removing unncessary .directory files
    find ${pkgdir}/usr -type f -name '.directory' -delete

    # Removing some unnecessary files
    rm -rf "$pkgdir"/usr/share/icons/suru-plus/{configure, .git, .gitignore, *.md, 'images', 'templates'}

    # Renaming the folder
    mv "$pkgdir"/usr/share/icons/suru-plus "$pkgdir"/usr/share/icons/Suru++\ 20
}
