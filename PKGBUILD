# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

# vim:set ts=2 sw=2 et:

pkgname='makeself'
pkgver='2.5.0'
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
md5sums=('0c0811d2134edafd7ac311e66fbdfb19')
sha256sums=('705d0376db9109a8ef1d4f3876c9997ee6bed454a23619e1dbc03d25033e46ea')
sha512sums=('cd0ce98579f00a02f9559848b39e0a6efea9df1866073d419f0b6560034cc186ed8315f8b4589e03f626b040727d9ae646bc2abaebe4f4da556b87617bdd770f')

prepare() {
  cd "${pkgname}-release-${pkgver}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}

package() {
  cd "${pkgname}-release-${pkgver}"
  #install -Dpm644 'makeself.lsm' 'README.md' -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/${pkgname}/"
}

