# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=freenom
pkgname=${_pkgname}-next
pkgver=20210910
pkgrel=2
pkgdesc='Freenom domain name renews automatically'
arch=('any')
url='https://github.com/luolongfei/next-freenom'
license=('MIT')
depends=('php')
backup=('etc/webapps/freenom/freenom.conf')
options=('!strip')
source=(${_pkgname}::"git+${url}.git"
        'freenom.service'
		'freenom.timer')
sha512sums=('SKIP'
            '7e8964f4f5994666d26a1c63656aff5364dbf11e9a5292babaab61ce56341e9516272aa67b03520d5876b08e6d05f9246d0449492908d5af0d273234aee47ab3'
			'0d7b19b9d00d93ce71c29c30fc5613d820dfa783ace7bf222c7cc920a785545eda8bb8d41c1e04bd253953341d9893eab6faaeb89c423b8d31412551c436d1f5')
provides=("freenom")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
  cd "$pkgdir"
  # create folders
  install -dm0755 usr/share/webapps usr/lib/systemd/system etc/webapps/freenom
  
  # app
  cp -a "${srcdir}/${_pkgname}" usr/share/webapps/freenom
  
  # service
  install -Dm644 ${srcdir}/freenom.service usr/lib/systemd/system/freenom.service
  
  # timer
  install -Dm644 ${srcdir}/freenom.timer usr/lib/systemd/system/freenom.timer
  
  # config
  install -Dm0644 "${srcdir}/${_pkgname}"/.env.example etc/webapps/freenom/freenom.conf
}

# vim:set ts=2 sw=2 et:
