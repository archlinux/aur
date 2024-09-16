# Contributor: Igor Belov <ivbelov@gmail.com>
# Contributor: Dennis Borisevich/denspirit <elfmax@tut.by>
# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=stardict-full-rus-eng
pkgver=2.4.2
pkgrel=6
pkgdesc="Large russian-english dictionary for Stardict"
license=('GPL-2.0-only')
makedepends=('stardict-tools-git' 'dictd')
optdepends=(
    'stardict: to use the dictionary'
    'goldendict: to use the dictionary'
)
# Origin is not available now
url='http://download.huzheng.org/ru/'
source=('http://sourceforge.net/projects/xdxf/files/dicts-stardict-form-xdxf/002c/stardict-comn_sdict05_rus_eng_full-2.4.2.tar.bz2')
_source_dir_name="stardict-rus_eng_full-$pkgver"
sha256sums=('929c61475051d177e41c255c55259c6e0d0bba483dd3b3f2f25e739d86ffc104')
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
