# Contributor: Daniel Miranda (dmiranda)
# Maintainer: Gustavo Costa (gusbemacbe)

_gitname=suru-plus
pkgname=suru-plus-git
pkgver=20.3.0
pkgrel=1
pkgdesc="Suru++ 20 — A cyberpunk, elegant, futuristic and modern third-party icons theme!"
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

    # Copying to the /usr/share/icons/ and changing name to "Suru++ 20"
    cp -r "${srcdir}"/suru-plus "${pkgdir}"/usr/share/icons/Suru++\ 20

    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;

    # Removing unncessary .directory files
    find ${pkgdir}/usr -type f -name '.directory' -delete

    # Deleting unneeded files
    rm -r "$pkgdir"/usr/share/icons/Suru++\ 20/.git
    rm -r "$pkgdir"/usr/share/icons/Suru++\ 20/.gitignore
    rm -r "$pkgdir"/usr/share/icons/Suru++\ 20/*.md
    rm -R "$pkgdir"/usr/share/icons/Suru++\ 20/images
    rm -R "$pkgdir"/usr/share/icons/Suru++\ 20/templates
}
