# Maintainer: Ivan Sosnov <ivanmsosnov@gmail.com>

pkgname=(spicetify-comfy-theme-git)
_pkgname=Comfy-spicetify
pkgver=r44.6935099
pkgrel=1
pkgdesc="Custom Spotify theme, built for Spicetify. Stay comfy while listening to music."
arch=('any')
url="https://github.com/NYRI4/$_pkgname"
license=('MIT')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')
depends=('spicetify-cli')
provides=('spicetify-comfy-theme')
install=spicetify-comfy-theme-git.install

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    echo "  -> Checking if Spicetify config exists..."
    spicetify
    
    echo "  -> Unpacking Theme..."
    mkdir -p "${pkgdir}"/usr/share/spicetify-cli/Themes
    cp -R "$srcdir"/${_pkgname} "${pkgdir}"/usr/share/spicetify-cli/Themes

    echo "  -> Cleaning Up..."
    rm "${pkgdir}"/usr/share/spicetify-cli/Themes/${_pkgname}/README.md "${pkgdir}"/usr/share/spicetify-cli/Themes/${_pkgname}/.gitignore "${pkgdir}"/usr/share/spicetify-cli/Themes/${_pkgname}/Comfy.js "${pkgdir}"/usr/share/spicetify-cli/Themes/${_pkgname}/LICENCE
    rm -r "${pkgdir}"/usr/share/spicetify-cli/Themes/${_pkgname}/.git 

    echo "  -> Unpacking Extension..."
    mkdir -p "${pkgdir}"/usr/share/spicetify-cli/Extensions
    cp -R "$srcdir/${_pkgname}"/Comfy.js "${pkgdir}"/usr/share/spicetify-cli/Extensions/Comfy.js

    echo "  -> Done. To activate the theme, please follow post-installation instructions."
}
