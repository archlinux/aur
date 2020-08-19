# Maintainer: Dmitry Bilunov <kmeaw@yandex-team.ru>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

#pkgbase=clickhouse
#pkgname=(clickhouse clickhouse-dbg)
pkgname=clickhouse
pkgver=20.6.3.28
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time'
arch=('x86_64')
url='https://clickhouse.tech/'
license=('Apache')
depends=('tzdata' 'libcap')
noextract=(
  clickhouse-common-static_${pkgver}_amd64.deb
  clickhouse-client_${pkgver}_all.deb
  clickhouse-server_${pkgver}_all.deb
  )
source=(
  https://repo.clickhouse.tech/deb/stable/main/clickhouse-common-static_${pkgver}_amd64.deb
  https://repo.clickhouse.tech/deb/stable/main/clickhouse-client_${pkgver}_all.deb
  https://repo.clickhouse.tech/deb/stable/main/clickhouse-server_${pkgver}_all.deb
  )
sha256sums=(
  1ec4802df6a4069884bb7461b753693bad919864fff4782f02d7406ab18e1d8e
  9133df7c11676ceed8175c771e6c41ae3b0029369d699fec7c5b6ea41ea8e07e
  17271d0314d22c3d5b2a7caee7ff4d00ca5f9ffa4eb6ebe29084e447d36ec52d
)
install=$pkgname.install

package() {
  for deb in "${noextract[@]}"; do
    bsdtar -xf $deb
    tar xf data.tar.gz -C "${pkgdir}"
  done

  gzip -d "${pkgdir}/usr/share/doc/${pkgname}-server/LICENSE.gz"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/share/doc/clickhouse-server/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  rm -rf "${pkgdir}/etc/cron.d" \
    "${pkgdir}/etc/init.d" \
    "${pkgdir}/etc/security" \
    "${pkgdir}/etc/systemd" \
    "${pkgdir}/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
