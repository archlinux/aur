# Maintainer: Liam Timms <timms5000@gmail.com>
# Maintainer: Sin Kim <kimsin98@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=datalad
pkgname=python-$_pkgname
pkgver=1.6.1
pkgrel=1
pkgdesc='Keep code, data, containers under control with git and git-annex'
arch=(any)
url="https://github.com/datalad/$_pkgname"
license=(MIT)
depends=(git-annex
         patool
         python
         python-annexremote
         python-boto3
         python-chardet
         python-distro
         python-fasteners
         python-gitlab
         python-giturlparse
         python-humanize
         python-iso8601
         python-keyring
         python-keyrings-alt
         python-looseversion
         python-msgpack
         python-packaging
         python-platformdirs
         python-requests
         python-setuptools # used at runtime
         python-tqdm)
makedepends=(python-{build,installer,wheel})
checkdepends=(mypy
              python-beautifulsoup4
              python-httpretty
              python-pytest
              python-types-python-dateutil
              python-types-requests
              python-vcrpy)
optdepends=('python-argcomplete: optional CLI completion'
            'python-datalad-next: extension for new and improved functionality and user experience'
            'python-dateutil: support for more date formats'
            'python-psutil: open-file detection for datalad.save.skip-openfiles'
            'python-requests-ftp: extra downloaders'
            'python-pyperclip: clipboard manipulations')
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('9c91f1fe0d05266fc5ec05128a42caab5e133a04b97622be317403093579f3a0')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
