
# Maintainer: Mikata Riko <sanbikappa@qq.com>

pkgname=krita-plugin-pythonplugindevelopertools-git
pkgver=r37.46a671a
pkgrel=1
epoch=
pkgdesc="Python plugin for Krita that assists with making python plugins for Krita"
arch=('any')
url="https://github.com/KnowZero/Krita-PythonPluginDeveloperTools"
license=('unknow')
depends=('krita' 'python-pyqt5')
provides=('krita-plugin-pythonplugindevelopertools' 'krita-plugin-pythonplugindevelopertools-bin')
conflicts=('krita-plugin-pythonplugindevelopertools' 'krita-plugin-pythonplugindevelopertools-bin')
install=.install
source=("$pkgname-$pkgver::git+https://github.com/KnowZero/Krita-PythonPluginDeveloperTools")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname-$pkgver"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
    # set the PluginDevTools.KritaAPI.*.zip file's save path to ~/.cache/krita/
    sed -i 's/os.path.dirname(os.path.realpath(__file__))/os.path.join(os.path.expanduser("~"),".cache","krita","PluginDevTools")/' plugindevtools/PluginDevTools/GetKritaAPI.py 

}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/share/krita/pykrita/"
    cp -r plugindevtools/{PluginDevTools,PluginDevTools.desktop} "$pkgdir/usr/share/krita/pykrita/"

}
