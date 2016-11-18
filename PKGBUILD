# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.6.12
pkgrel=1
pkgdesc='Finds outdated running applications in your system'
_dirname="tracer-tracer-$pkgver-1"
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-beautifulsoup4' 'python-lxml' 'python-psutil' 'pyalpm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz"
        'tracer-hook-wrapper'
        'tracer.hook')
sha256sums=('cfb97fc1eeeb729f1aebee3f8c2f43d1c682682a551c79d920d52f4ee9582021'
            '2b97deaa510314bacad92e49e52c7324385b26e70af24371fc0f10ac69496d95'
            '8959a54a1458af5587fec968c193e0d46cfb267c34db807bb6265df1aeb0027b')

build() {
    cd "$_dirname"

    python setup.py build
}

package() {
    cd "$_dirname"

    python setup.py install -O1 --skip-build --root="$pkgdir"

    install -Dm755 "$srcdir/tracer-hook-wrapper" "$pkgdir/usr/lib/tracer/tracer-hook-wrapper"
    install -Dm644 "$srcdir/tracer.hook" "$pkgdir/usr/share/libalpm/hooks/50-tracer.hook"
}

