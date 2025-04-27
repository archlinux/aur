# Maintainer : Utku Helvacı <utku.helvaci.tux@gmail.com>
# Contributor: David Holland <info@dustvoice.de>
# Contributor: Ryan Fantus <https://aur.archlinux.org/account/cloverskull>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

#Renoise_Redux_1_3_5_Demo_Linux_x86_64.tar.gz

pkgname="renoise-redux"
pkgver="1.3.5"
_pkgver="$(echo $pkgver|tr '.' '_')"
pkgrel="1"
pkgdesc="A sampler VST plugin from Renoise"
arch=("x86_64")
url="https://www.renoise.com/products/redux"
license=("custom:redux")
depends=()
optdepends=()
makedepends=("execstack")
options=("!strip")
conflicts=("renoise-redux-beta")

file="$(echo *$_pkgver*Linux_$arch.tar.gz)"
source=("file://$file")
md5sums=('467c9e0a66a436802df3c3ce43074b3c')

package() {
cd  "$srcdir"
cd Redux_*$pkgver*Linux_$arch
cd "renoise_redux_$arch"
    #cd "$srcdir/*$pkgver*Linux_$arch/renoise_redux_${arch}"
    #for some reason line above didn't worked (bash wildcard match) so I had to divide cd to multiple lines

    mkdir -p "$pkgdir/usr/lib/vst/renoise-redux.vst"
    execstack -c renoise_redux.so
    #required due to recent glibc update
    cp -r renoise_redux.so renoise_redux.res "$pkgdir/usr/lib/vst/renoise-redux.vst"
    chmod -R 755 "$pkgdir/usr/lib/vst/renoise-redux.vst"
}
