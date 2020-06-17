# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

# vim:set ts=2 sw=2 et:

pkgname='makeself'
pkgver='2.4.2'
pkgrel='1'
pkgdesc='Utility to create self-extracting packages'
arch=('any')
url='http://megastep.org/makeself'
license=('GPL')
depends=('bash')
optdepends=(
  'gzip: compression support'
  'bzip2: compression support'
  'pbzip2: compression support'
  'xz: compression support'
  'lzop: compression support (lzo)'
  'lz4: compression support'
  'zstd: compression support'
  'pigz: compression support'
  # 'base64: encoding support' # coreutils
  'gnupg: encryption support'
  'openssl: encryption support'
  'ncompress: compression support'
  #'md5sum: digest support' # coreutils
  #'sha256sum: digest support' # coreutils
  'tar: archive support'
)
source=("${pkgname}-release-${pkgver}.tar.gz::https://github.com/megastep/${pkgname}/archive/release-${pkgver}.tar.gz")
md5sums=('7f81a68ee6a8db39ca099e93e7bbc5ed')
sha256sums=('8789312db5e93fc471a1e4fb88ec13227ef63a9c7aad297f3bbf35f9511f8d62')
sha512sums=('9a80442b53193db22ea13862a7c3923d7e6774babfb505d136b40ba67793068287beaad926087fa97e16e5e9d7aca38a6e77c0f483b1cd95a7b1e6b1766b9e5d')

prepare() {
  cd "${pkgname}-release-${pkgver}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}

package() {
  cd "${pkgname}-release-${pkgver}"
  install -Dpm644 'makeself.lsm' 'README.md' -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/${pkgname}/"
}

