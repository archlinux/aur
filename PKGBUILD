# Contributor: Igor Belov <ivbelov@gmail.com>
# Contributor: Dennis Borisevich/denspirit <elfmax@tut.by>
# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=stardict-full-eng-rus
pkgver=2.4.2
pkgrel=8
pkgdesc="Large English-Russian dictionary for Stardict"
license=('GPL-2.0-only')
makedepends=('stardict-tools-git' 'dictd')
optdepends=(
    'stardict: to use the dictionary'
    'goldendict: to use the dictionary'
)
# Origin is not available now
url='http://download.huzheng.org/ru/'
source=('http://sourceforge.net/projects/xdxf/files/dicts-stardict-form-xdxf/002c/stardict-comn_sdict05_eng_rus_full-2.4.2.tar.bz2')
_source_dir_name="stardict-eng_rus_full-$pkgver"
sha256sums=('1a6d0aa6abc594f9f8fc8f4938637173267e9e54e534e2ecfbc672b7f284dcbb')
arch=(any)

prepare() {
    echo 'Repairing dictionary...'
    cd $srcdir/
    mkdir -p repaired
    stardict-repair --compress-dict -q "${_source_dir_name}/"*.ifo -O repaired
}

package() {
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 repaired/* $pkgdir/usr/share/stardict/dic/
}
