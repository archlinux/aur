# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: CrookedNixon <cn@crookednixon.com>

set -u
pkgname='smtp-cli'
pkgver='3.10'
pkgrel='3'
pkgdesc='Perl based command line SMTP client'
arch=('any')
url='http://www.logix.cz/michal/devel/smtp-cli'
license=('GPL')
depends=('perl' 'perl-io-socket-ssl' 'perl-net-ssleay' 'perl-io-socket-inet6' 'perl-mime-lite' 'perl-file-type' 'perl-term-readkey' 'perl-digest-hmac' 'perl-email-date-format')
optdepends=(
  #'perl-io-socket-ssl: SSL'
  #'perl-net-ssleay: STARTTLS TLS'
  #'perl-io-socket-inet6: ipv6'
  #'perl-mime-lite: attachments'
  #'perl-file-type: identify files, alternate to perl-file-libmagic'
  #'perl-file-libmagic: identify files, alternate to perl-file-type'
  #'perl-term-readkey: password from terminal'
  'perl-net-dns: resolving recipient MX record'
)
#source=("http://www.logix.cz/michal/devel/smtp-cli/${pkgname}-${pkgver}")
_giturl="https://github.com/mludvig/${pkgname}"
_verwatch=("${_giturl}/releases.atom" '\s\+<title>v\([0-9\.]\+\)</title>.*' 'f')
_patches=(
  '0000-Getopt-Long-duplicate-specfication-disable-ssl.patch'
)
options=('!strip')
_srcdir="${pkgname}-${pkgver}"
source=("${_srcdir}.tar.gz::https://github.com/mludvig/smtp-cli/archive/v${pkgver}.tar.gz" "${_patches[@]}")
md5sums=('ab5c30778cc2a93f7faf549edc4fcaa3'
         'a41ab9223eda25fd5fce5d0949920ee5')
sha256sums=('334c48a1c1c3b2a9418f98ce1ac15080cff50aab55618bbac95090e7f39ff71f'
            '73fd7db8ad085c0977df932043af04bb9b865fa23030d0b2b35a5e3701ee87ea')

prepare() {
  set -u
  cd "${_srcdir}"
  local _pt
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    patch -Nup1 -i "${srcdir}/${_pt}"
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
