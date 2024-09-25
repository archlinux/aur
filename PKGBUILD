# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=qobuz-dl
pkgver=0.9.9.10
pkgrel=1
pkgdesc="Search, explore and download Lossless and Hi-Res music from Qobuz."
url="https://github.com/vitiko98/qobuz-dl"
depends=('python-beautifulsoup4' 'python-colorama' 'python-mutagen'
         'python-pathvalidate' 'python-pick' 'python-requests'
         'python-tqdm' 'python-pathvalidate' 'python-pick')
makedepends=('python-setuptools')
license=('GPL-3.0-or-later')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/vitiko98/qobuz-dl/pull/179.patch"
        "rm-pick-version-constraint.patch"
        "free-user-dl.patch")
md5sums=('985837a373fbd79ea5b011d8e68f6eb7'
         '210bb57683990d016ecff7bbf2ffe7c4'
         'c7ceb065a6000acf8a5c0577a447338a'
         '39420c64abeed8b266f3fd0646f64e8c')
sha256sums=('abb4d4977b1c83e8aca0b074c49bc92c2b6f254ecefa880c95fb6dd0eef7a9be'
            '2ba94ce02d9ffe39c0b9ce7357d6629561b3eae99e783393ce22f0e2062d81d1'
            '41994c053d0a24705b0c7052351cd95adfe6596a0fabe294ae6217ef4e3b5aa7'
            'e5c6b8b75383d6b442e84132e0da3d9c44c99e4acb56f066277a95be586e695a')

prepare() {
	cd "${pkgname}-${pkgver}"
	for patch in "${srcdir}"/*.patch; do
		patch -p1 --binary < "${patch}"
	done
}

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
