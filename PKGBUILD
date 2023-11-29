# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=specter-desktop
pkgver=2.0.2
pkgrel=2
pkgdesc="Specter Desktop functions as a watch-only coordinator for multi-signature and single-key Bitcoin wallets."
arch=('any')
url="https://specter.solutions"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-aniso8601' 'python-apscheduler' 'python-babel' 'python-base58' 'python-bitbox02' 'python-cbor' 'python-certifi' 'python-cffi' 'python-chardet' 'python-charset-normalizer' 'python-click' 'python-cryptography' 'python-ecdsa' 'python-embit' 'python-flask' 'python-flask-apscheduler' 'python-flask-babel' 'python-flask-cors' 'python-flask-httpauth' 'python-flask-login' 'python-flask-restful' 'python-flask-sqlalchemy' 'python-flask-wtf' 'python-greenlet' 'gunicorn' 'python-h11' 'python-hidapi' 'python-hwilib<=2.2.1' 'python-idna' 'python-itsdangerous' 'python-jinja' 'python-libusb1' 'python-markupsafe' 'python-mnemonic' 'python-noiseprotocol-git' 'python-numpy' 'python-pandas' 'python-pgpy' 'python-plotly' 'python-protobuf' 'python-psutil' 'python-psycopg2' 'python-pyaes' 'python-pyasn1' 'python-pycparser' 'python-pyjwt' 'python-pyopenssl' 'python-pyserial' 'python-pysocks' 'python-dateutil' 'python-dotenv' 'python-pytimeparse' 'python-pytz' 'python-pytz-deprecation-shim' 'python-requests' 'python-semver' 'python-simple-websocket' 'python-six' 'python-sqlalchemy' 'python-stem' 'python-tenacity' 'python-typing-extensions' 'python-tzdata' 'python-tzlocal' 'python-urllib3' 'python-werkzeug' 'python-wsproto' 'python-wtforms' 'python-importlib-metadata' 'python-daemonize' 'python-wheel' 'specterext-exfund' 'specterext-faucet' 'specterext-liquidissuer' 'specterext-spectrum' 'specterext-stacktrack')
backup=(usr/lib/systemd/system/specter.service)
install=$pkgname.install
source=("https://github.com/cryptoadvance/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'specter.service'
	'specter-desktop.install')

sha256sums=('da12e3da151d75647a0736e308b889014001c45d883f7a417287227f4ae7c647'
            '9b5f57a0ebd48e6b7d1ac240913e4b502a6e3ffc5b64ff87ed263f1a4810a265'
	    '668ace7f14369014e42197321fa7e0edc90737c87e2b6a68354ab205d37e3aa6')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1

  # install systemd file
  install -Dm 644 "${srcdir}"/*.service -t "${pkgdir}"/usr/lib/systemd/system

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
