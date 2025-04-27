# Maintainer : Utku Helvacı <utku.helvaci.tux@gmail.com>
# Contributor: David Holland <info@dustvoice.de>
# Contributor: Ryan Fantus <https://aur.archlinux.org/account/cloverskull>
# Contributor: Takahashi, Naoki <tkna91@gmail.com>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

#Renoise_Redux_1_3_5_Demo_Linux_x86_64.tar.gz
#You can put either the demo file or the paid for file. don't rename the file

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
if echo $file|grep -q 'Demo'
then md5sums=('467c9e0a66a436802df3c3ce43074b3c')
else md5sums=('6e2647b43fddb0d648679973cb70fb27')
#based on tkna's comment  at https://aur.archlinux.org/packages/renoise-redux#comment-980856 . I don't have access to the premium file. I don't know the file name either
fi

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
