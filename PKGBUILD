# Maintainer: ahla <superplant[at]gmx[dot]de>

pkgname=sguil-sensor
pkgver=0.9.0
pkgrel=1
pkgdesc="A network security monitoring program (sensor instance)"
arch=('any')
url="http://www.sguil.net/" 
license=('GPL3') 
depends=('tcl' 'tls')
optdepends=("barnyard2: A dedicated spooler for Snort's unified2 binary output format." "snort: IPS\IDS detection solution" "suricata: Multi-threaded IPS\IDS" "pads: Passive Asset Detection System (pads)")
source=("https://github.com/bammv/sguil/archive/v${pkgver}.tar.gz")
md5sums=('c59dccc15835204ace2a335356dfd487')
sha256sums=('412be894d67a6487312dd16a98a580dda8c38cff2e24f7a6c25405857769782b')

package() {
  _sensor_agents="example_agent.tcl pads_agent.tcl pcap_agent-sancp.tcl pcap_agent.tcl sancp_agent.tcl sensor_agent.tcl snort_agent.tcl"
  _sensor_confs="example_agent.conf pads_agent.conf pcap_agent-sancp.conf pcap_agent.conf sancp-indexed.conf sancp_agent.conf sensor_agent.conf snort_agent.conf"
  _log_scripts="log_packets-daemonlogger.sh log_packets-sancp.sh log_packets.sh"
  _docs="README.daemonlogger README.sancp_indexed_pcap"

  cd sguil-${pkgver}/sensor

  mkdir -p "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/etc/${pkgname}" "${pkgdir}/usr/share/doc/${pkgname}"

  cp ${_sensor_agents} ${pkgdir}/usr/bin/${pkgname}/
  cp ${_sensor_confs} ${pkgdir}/etc/${pkgname}/
  cp ${_log_scripts} ${pkgdir}/usr/bin/${pkgname}/
  cp ${_docs} ${pkgdir}/usr/share/doc/${pkgname}/

  chmod 644 ${pkgdir}/etc/${pkgname}/*
}
