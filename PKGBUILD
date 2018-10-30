# Maintainer: Simon Doppler (dopsi@dopsi.ch)
pkgname=pb
pkgver=0.7.0
pkgrel=1
pkgdesc="lightweight pastebin and url shortener built using flask"
arch=('any')
url="https://github.com/ptpb/pb"
license=('GPL3')

depends=('python' 'python-werkzeug' 'python-flask' 'python-yaml'
         'python-requests' 'python-docutils' 'python-xdg'
         'python-pymongo' 'python-markdown' 'python-dateutil'
         'uwsgi' 'uwsgi-plugin-python'
         'python-click' 'python-pygments' 'python-pytz')

makedepends=('python-setuptools' 'git')
optdepends=('pbs: pb styles and static resources')

backup=('etc/xdg/pb/config.yaml' 'etc/uwsgi/pb.ini')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ptpb/pb/archive/$pkgver.tar.gz")
md5sums=('b8c421b8d2fcc8a0de97aa752b337029')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname"
  install -D -m644 config.yaml.example "${pkgdir}/etc/xdg/pb/config.yaml"
  install -D -m644 pkg/pb.ini.example "${pkgdir}/etc/uwsgi/pb.ini"
  install -D -m644 pkg/pb.service "${pkgdir}/usr/lib/systemd/system/pb.service"
}
