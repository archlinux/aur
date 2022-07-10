# Maintainer: 0chroma <me@chroma.sh>
pkgname=vidplayvst
pkgver=2.3.1
pkgrel=1
pkgdesc='VidPlayVST is a plug-in for producers composing music synchronised to video.'
arch=(x86_64)
url='https://vidplayvst.com/'
license=('')
depends=()
optdepends=()
provides=(vidplayvst)
#makedepends=()
source=("VidPlayVST-$pkgver-Setup.run::https://docs.google.com/uc?id=18_dOOqxYpdYlUIhZDWsYwEJH8QPkDP28&export=download&confirm=t")
sha256sums=('c7955aed03e442d1222269c1d3444b5ac59b107eab55dcbe1f1427a4241ceb9c')

package() {
    cd "$srcdir"
    ls
    chmod +x "VidPlayVST-$pkgver-Setup.run"
    command=("./VidPlayVST-$pkgver-Setup.run" --noexec --target .)
    "${command[@]}"
    sed -i 's/^sudo //g' setup.sh
    sed -i "s#\~#/usr/share/vidplayvst#g" setup.sh
    sed -i "s# \/# ${pkgdir}/#g" setup.sh
    sh setup.sh
}
