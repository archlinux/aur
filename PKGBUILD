# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgbase=neutron-kilo
pkgname=neutron-kilo
pkgname=('python2-neutron-kilo'
	 'neutron-kilo'
	 'neutron-dhcp-agent-kilo'
         'neutron-l3-agent-kilo'
         'neutron-metadata-agent-kilo'
         'neutron-metering-agent-kilo'
         'neutron-plugin-bigswitch-kilo'
         'neutron-plugin-bigswitch-agent-kilo'
         'neutron-plugin-brocade-kilo'
         'neutron-plugin-cisco-kilo'
	 'neutron-plugin-cisco-agent-kilo'
	 'neutron-plugin-embrane-kilo'
         'neutron-plugin-hyperv-agent-kilo'
         'neutron-plugin-ibm-kilo'
         'neutron-plugin-ibm-agent-kilo'
         'neutron-plugin-linuxbridge-kilo'
         'neutron-plugin-linuxbridge-agent-kilo'
         'neutron-plugin-metaplugin-kilo'
         'neutron-plugin-midonet-kilo'
         'neutron-plugin-ml2-kilo'
         'neutron-plugin-mlnx-kilo'
         'neutron-plugin-mlnx-agent-kilo'
         'neutron-plugin-nec-kilo'
         'neutron-plugin-nec-agent-kilo'
         'neutron-plugin-nuage-kilo'
         'neutron-plugin-oneconvergence-kilo'
         'neutron-plugin-oneconvergence-agent-kilo'
         'neutron-plugin-opencontrail-kilo'
         'neutron-plugin-openvswitch-kilo'
         'neutron-plugin-openvswitch-agent-kilo'
	 'neutron-plugin-ovsvapp-kilo'
	 'neutron-plugin-ovsvapp-agent-kilo'
         'neutron-plugin-plumgrid-kilo'
         'neutron-plugin-vmware-kilo'
         'neutron-plugin-sriovnic-agent-kilo')

pkgver=2015.1.0
pkgrel=4
pkgdesc="A virtual network service for Openstack"
arch=(any)
url="https://launchpad.net/neutron"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslosphinx-kilo')
source=("https://launchpad.net/neutron/kilo/$pkgver/+download/neutron-$pkgver.tar.gz"
        "neutron-dhcp-agent.service"
        "neutron-l3-agent.service"
        "neutron-metadata-agent.service"
        "neutron-metering-agent.service"
        "neutron-bigswitch-agent.service"
	"neutron-plugin-ibm-agent.service"
        "neutron-plugin-linuxbridge-agent.service"
        "neutron-plugin-mlnx-agent.service"
        "neutron-plugin-nec-agent.service"
	"neutron-plugin-oneconvergence-agent.service"
        "neutron-plugin-openvswitch-agent.service"
        "neutron-plugin-ryu-agent.service"
        "neutron-plugin-vpn-agent.service"
        "neutron-server-default"
        "neutron-server.service"
        "neutron_sudoers"
        "neutron.plugin.openvswitch.install")
md5sums=('719a69834798f76a5c9560c3d467c15e'
         'c59c436057efbb2317487a0822aa97e7'
         'ca5d870e84ca2cce40bab18bf770870f'
         '1ab745acf0da636c4484803969229714'
         'ef5a00d81ecea910fb29706e3181fc80'
         'e0a25a272eaeb3b4f79404c2d2cd1379'
         'c954b9a3163fddac1623ec50ba7bfc98'
         '31ed220677df34466ca25fb1d64e9df0'
         '926c8fe2ec3fd79955ed8f74109fceea'
         '50bc95405d91d73a583c508a0446e38c'
         'de6e4e853477f3116b515fa9e80b306f'
         'f40d35da4256957eb0dd6e0ce6a4c696'
         '50946c6024c5043c7046968e6eb9b698'
         '9f2af5aef38b58a6b11f715059aecb95'
         '91d4643e9c29210cc82ec8c8c512675d'
         '7c710afee7078e7a52d3708acd158c26'
         '2cfc83f85ae2f8bc790e280da721262d'
         'fd68f680bfa312a0a17c705924cfe662')

build() {
  cd "neutron-$pkgver"
  sed -i 's|/usr/sbin/dnsmasq|/usr/bin/dnsmasq|g' etc/neutron/rootwrap.d/dhcp.filters
  python2 setup.py build
  python2 setup.py build_sphinx
  python2 setup.py install --root="$srcdir/tmp" --install-data="/" --optimize=1
}

package_python2-neutron-kilo() {
  pkgdesc+=" - Python library"
  depends=('python2-pbr>=0.6'
           'python2-paste'
           'python2-paste-deploy>=1.5.0'
           'python2-routes>=1.12.3'
           'python2-eventlet>=0.16.0'
           'python2-greenlet>=0.3.2'
           'python2-httplib2>=0.7.5'
           'python2-requests>=2.2'
           'python2-jsonrpclib'
           'python2-jinja>=2.6'
           'python2-keystonemiddleware-kilo'
           'python2-netaddr>=0.7.12'
           'python2-neutronclient-kilo'
           'python2-retrying>=1.2.3'
           'python2-sqlalchemy-kilo'
           'python2-webob>=1.2.3'
           'python2-keystoneclient-kilo'
           'python2-alembic>=0.7.2'
           'python2-six>=1.9.0'
           'python2-stevedore-kilo'
           'python2-oslo-concurrency-kilo'
           'python2-oslo-config-kilo'
           'python2-oslo-context-kilo'
           'python2-oslo-db-kilo'
           'python2-oslo-i18n-kilo'
           'python2-oslo-log-kilo'
           'python2-oslo-messaging-kilo'
           'python2-oslo-middleware-kilo'
           'python2-oslo-rootwrap-kilo'
           'python2-oslo-serialization-kilo'
           'python2-oslo-utils-kilo'
           'python2-novaclient-kilo')
  conflics=('python2-quantum' 
            'python2-neutron'
            'python2-neutron-havana'
            'python2-neutron-icehouse')

  cd tmp
  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}

package_neutron-kilo() {
  pkgdesc+=" - Server"
  install=neutron.install
  depends=('python2-neutron-kilo')
  conflics=('quantum-common'
            'quantum-server'
            'neutron-common'
            'neutron-server'
            'neutron-havana'
            'neutron-icehouse')
  optdepends=('neutron-plugin-openvswitch-kilo')
  backup=('etc/neutron/api-paste.ini'
          'etc/neutron/neutron.conf')

  cd tmp
  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/api-paste.ini ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/l3_agent.ini ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/neutron.conf ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/policy.json ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.conf ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/debug.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 644 etc/neutron/rootwrap.d/ipset-firewall.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 644 etc/neutron/rootwrap.d/iptables-firewall.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 644 etc/neutron/rootwrap.d/l3.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -d -m 0750 ${pkgdir}/etc/sudoers.d/
  install -m 440 ${srcdir}/neutron_sudoers ${pkgdir}/etc/sudoers.d/
  
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-db-manage ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-debug ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-keepalived-state-change ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-netns-cleanup ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ovs-cleanup ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap-daemon ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap-xen-dom0 ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-sanity-check ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-usage-audit ${pkgdir}/usr/bin/

  install -d -m 0770 ${pkgdir}/var/lib/neutron/
  install -d -m 0770 ${pkgdir}/var/log/neutron/

  install -D -m 644 ${srcdir}/neutron-server-default ${pkgdir}/etc/default/neutron-server
  install -D -m 755 usr/bin/neutron-server ${pkgdir}/usr/bin/neutron-server
  install -D -m 644 ${srcdir}/neutron-server.service ${pkgdir}/usr/lib/systemd/system/neutron-server.service
}

package_neutron-dhcp-agent-kilo() {
  pkgdesc+=" - DHCP agent"
  depends=('neutron-kilo'
           'dnsmasq'
           'neutron-metadata-agent-kilo')
  conflics=('quantum-dhcp-agent' 'neutron-dhcp-agent' 'neutron-dhcp-agent-icehouse')
  backup=('etc/neutron/dhcp_agent.ini')

  cd tmp
  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/dhcp_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/dhcp.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-dhcp-agent ${pkgdir}/usr/bin/
  install -D -m 644 ${srcdir}/neutron-dhcp-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-dhcp-agent.service
}

package_neutron-l3-agent-kilo() {
  pkgdesc+=" - l3 agent"
  depends=('neutron-kilo'
           'neutron-metadata-agent-kilo')
  conflics=('quantum-l3-agent'
            'neutron-l3-agent'
            'neutron-l3-agent-icehouse')
  backup=('etc/neutron/l3_agent.ini')

  cd tmp
  install -D -m 755 usr/bin/neutron-l3-agent ${pkgdir}/usr/bin/neutron-l3-agent
  install -D -m 644 ${srcdir}/neutron-l3-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-l3-agent.service
}

package_neutron-metadata-agent-kilo() {
  pkgdesc+=" - metadata agent"
  depends=('neutron-kilo')
  conflics=('quantum-metadata-agent'
            'neutron-metadata-agent'
            'neutron-metadata-agent-icehouse')
  backup=('etc/neutron/metadata_agent.ini')

  cd tmp
  install -D -m 640 etc/neutron/metadata_agent.ini ${pkgdir}/etc/neutron/metadata_agent.ini
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-metadata-agent ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ns-metadata-proxy ${pkgdir}/usr/bin/
  install -D -m 644 ${srcdir}/neutron-metadata-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-metadata-agent.service
}

package_neutron-metering-agent-kilo() {
  pkgdesc+=" - metering agent"
  depends=('neutron-kilo')
  
  cd tmp
  install -D -m 640 etc/neutron/metering_agent.ini "${pkgdir}/etc/neutron/metering_agent.ini"
  install -D -m 755 usr/bin/neutron-metering-agent "${pkgdir}/usr/bin/neutron-metering-agent"
  install -D -m 644 "${srcdir}/neutron-metering-agent.service" "${pkgdir}/usr/lib/systemd/system/neutron-metering-agent.service"
}

package_neutron-plugin-bigswitch-kilo() {
  pkgdesc+=" - BigSwitch agent"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-bigswitch'
            'neutron-plugin-bigswtich'
            'neutron-plugin-bigswitch-icehouse')
  backup=('etc/neutron/plugins/bigswitch/restproxy.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/bigswitch/restproxy.ini ${pkgdir}/etc/neutron/plugins/bigswitch/restproxy.ini
  install -D -m 640 etc/neutron/plugins/bigswitch/ssl/ca_certs/README ${pkgdir}/etc/neutron/plugins/bigswitch/ssl/ca_certs
  install -D -m 640 etc/neutron/plugins/bigswitch/ssl/host_certs/README ${pkgdir}/etc/neutron/plugins/bigswitch/ssl/host_certs
}

package_neutron-plugin-bigswitch-agent-kilo() {
  pkgdesc+=" - BigSwitch plugin  agent"
  depends=('neutron-plugin-bigswitch-kilo')
  
  cd tmp
  install -D -m 755 usr/bin/neutron-restproxy-agent "${pkgdir}/usr/bin/neutron-restproxy-agent"
  install -D -m 644 "${srcdir}/neutron-bigswitch-agent.service" "${pkgdir}/usr/lib/systemd/system/neutron-bigswitch-agent.service"
}

package_neutron-plugin-brocade-kilo() {
  pkgdesc+=" - Brocade plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-brocade'
            'neutron-plugin-brocade'
            'neutron-plugin-brocade-icehouse')
  backup=('etc/neutron/plugins/brocade/brocade.ini')

  cd tmp
  install -d "${pkgdir}/etc/neutron/plugins/brocade/vyatta/"
  install -m 640 etc/neutron/plugins/brocade/brocade.ini ${pkgdir}/etc/neutron/plugins/brocade/brocade.ini
  install -m 640 etc/neutron/plugins/brocade/brocade_mlx.ini ${pkgdir}/etc/neutron/plugins/brocade/brocade_mlx.ini
  install -m 640 etc/neutron/plugins/brocade/vyatta/vrouter.ini ${pkgdir}/etc/neutron/plugins/brocade/vyatta/vrouter.ini
}

package_neutron-plugin-cisco-kilo() {
  pkgdesc+=" - Cisco plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-cisco'
            'neutron-plugin-cisco'
            'neutron-plugin-cisco-kilo')
  backup=('etc/neutron/plugins/cisco/cisco_plugins.ini')

  cd tmp
  install -d ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_cfg_agent.ini ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_plugins.ini ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_router_plugin.ini ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_vpn_agent.ini ${pkgdir}/etc/neutron/plugins/cisco/
}

package_neutron-plugin-cisco-agent-kilo() {
  pkgdesc+=" - Cisco plugin agent"
  depends=('neutron-plugin-cisco-kilo')

  cd tmp
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-cisco-apic-host-agent "${pkgdir}/usr/bin/neutron-cisco-apic-host-agent"
  install -m 755 usr/bin/neutron-cisco-apic-service-agent "${pkgdir}/usr/bin/neutron-cisco-apic-service-agent"
}

package_neutron-plugin-embrane-kilo() {
  pkgdesc+=" - embrane plugin"
  depends=('neutron-kilo')
  backup=('etc/neutron/plugins/embrane/heleos_conf.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/embrane/heleos_conf.ini ${pkgdir}/etc/neutron/plugins/embrane/heleos_conf.ini
}

package_neutron-plugin-hyperv-agent-kilo() {
  pkgdesc+=" - Hyper-V plugin agent"
  depends=('neutron--kilo')
  conflics=('neutron-plugin-hyperv')

  cd tmp
  install -D -m 755 usr/bin/neutron-hyperv-agent "${pkgdir}/usr/bin/neutron-hyperv-agent"
}

package_neutron-plugin-ibm-kilo() {
  pkgdesc+=" - IBM SDN plugin"
  depends=('neutron-kilo')
  backup=('etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini ${pkgdir}/etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini
}

package_neutron-plugin-ibm-agent-kilo() {
  pkgdesc+=" - IBM SDN plugin agent"
  depends=('neutron-plugin-ibm-kilo')

  cd tmp
  install -D -m 755 usr/bin/neutron-ibm-agent "${pkgdir}/usr/bin/neutron-ibm-agent"
  install -D -m 755 "${srcdir}/neutron-plugin-ibm-agent.service" "${pkgdir}/usr/lib/systemd/system/neutron-plugin-ibm-agent.service"
}

package_neutron-plugin-linuxbridge-kilo() {
  pkgdesc+=" - linuxbridge plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-linuxbridge'
            'neutron-plugin-linuxbridge'
            'neutron-plugin-linuxbridge-icehouse')
  backup=('etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini ${pkgdir}/etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini
}

package_neutron-plugin-linuxbridge-agent-kilo() {
  pkgdesc+=" - linuxbridge plugin agent"
  depends=('bridge-utils'
           'neutron-plugin-linuxbridge-kilo')
  conflics=('quantum-plugin-linuxbridge-agent'
            'neutron-plugin-linuxbridge-agent'
            'neutron-plugin-linuxbridge-agent-kilo')

  cd tmp
  install -D -m 644 etc/neutron/rootwrap.d/linuxbridge-plugin.filters ${pkgdir}/etc/neutron/rootwrap.d/linuxbridge-plugin.filters
  install -D -m 755 usr/bin/neutron-linuxbridge-agent ${pkgdir}/usr/bin/neutron-linuxbridge-agent
  install -D -m 644 ${srcdir}/neutron-plugin-linuxbridge-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-linuxbridge-agent.service
}

package_neutron-plugin-metaplugin-kilo() {
  pkgdesc+=" - Metaplug	in plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-metaplugin'
            'neutron-plugin-metaplugin'
            'neutron-plugin-metaplugin-icehouse')
  backup=('etc/neutron/plugins/metaplugin/metaplugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/metaplugin/metaplugin.ini ${pkgdir}/etc/neutron/plugins/metaplugin/metaplugin.ini
}

package_neutron-plugin-midonet-kilo() {
  pkgdesc+=" - Midonet plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-midonet'
            'neutron-plugin-midonet'
            'neutron-plugin-midonet-kilo')
  backup=('etc/neutron/plugins/midonet/midonet.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/midonet/midonet.ini ${pkgdir}/etc/neutron/plugins/midonet/midonet.ini
}

package_neutron-plugin-ml2-kilo() {
  pkgdesc+=" - ML2 plugin"
  depends=('neutron-kilo')
  conflics=('neutron-plugin-ml2-agent')
  backup=('etc/neutron/plugins/ml2/ml2_conf.ini'
          'etc/neutron/plugins/ml2/ml2_conf_arista.ini'
          'etc/neutron/plugins/ml2/ml2_conf_brocade.ini'
          'etc/neutron/plugins/ml2/ml2_conf_brocade_fi_ni.ini'
          'etc/neutron/plugins/ml2/ml2_conf_cisco.ini'
          'etc/neutron/plugins/ml2/ml2_conf_fslsdn.ini'
          'etc/neutron/plugins/ml2/ml2_conf_mlnx.ini'
          'etc/neutron/plugins/ml2/ml2_conf_ncs.ini'
          'etc/neutron/plugins/ml2/ml2_conf_ofa.ini'
          'etc/neutron/plugins/ml2/ml2_conf_sriov.ini'
          'etc/neutron/plugins/ml2/nuage_plugin.ini'
          'etc/neutron/plugins/ml2/restproxy.ini')

  cd tmp
  install -d ${pkgdir}/etc/neutron/plugins/ml2/
  install -m 640 etc/neutron/plugins/ml2/ml2_conf.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_arista.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_arista.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_brocade.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_brocade.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_brocade_fi_ni.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_brocade_fi_ni.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_cisco.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_cisco.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_fslsdn.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_fslsdn.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_mlnx.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_mlnx.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_ncs.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_ncs.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_ofa.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_ofa.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_sriov.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_sriov.ini
  install -m 640 etc/neutron/plugins/ml2/nuage_plugin.ini ${pkgdir}/etc/neutron/plugins/ml2/nuage_plugin.ini
  install -m 640 etc/neutron/plugins/ml2/restproxy.ini ${pkgdir}/etc/neutron/plugins/ml2/restproxy.ini
}

package_neutron-plugin-mlnx-kilo() {
  pkgdesc+=" - MLNX plugin"
  depends=('neutron-kilo')
  conflics=('neutron-plugin-mlnx-agent'
            'neutron-plugin-mlnx-agent-icehouse')
  backup=('etc/neutron/plugins/mlnx/mlnx_conf.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/mlnx/mlnx_conf.ini ${pkgdir}/etc/neutron/plugins/mlnx/mlnx_conf.ini
}

package_neutron-plugin-mlnx-agent-kilo() {
  pkgdesc+=" - MLNX plugin agent"
  depends=('neutron-plugin-mlnx-kilo')
  conflics=('neutron-plugin-mlnx-agent'
            'neutron-plugin-mlnx-agent-icehouse')

  cd tmp
  install -D -m 755 usr/bin/neutron-mlnx-agent ${pkgdir}/usr/bin/neutron-mlnx-agent
  install -D -m 644 ${srcdir}/neutron-plugin-mlnx-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-mlnx-agent.service
}

package_neutron-plugin-nec-kilo() {
  pkgdesc+=" - NEC plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-nec'
            'neutron-plugin-nec'
            'neutron-plugin-nec-icehouse')
  backup=('etc/neutron/plugins/nec/nec.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/nec/nec.ini ${pkgdir}/etc/neutron/plugins/nec/nec.ini
}

package_neutron-plugin-nec-agent-kilo() {
  pkgdesc+=" - NEC plugin agent"
  depends=('neutron-plugin-nec-kilo')
  conflics=('quantum-plugin-nec-agent'
            'neutron-plugin-nec-agent'
            'neutron-plugin-nec-agent-icehouse')

  cd tmp
  install -D -m 644 etc/neutron/rootwrap.d/nec-plugin.filters ${pkgdir}/etc/neutron/rootwrap.d/nec-plugin.filters
  install -D -m 755 usr/bin/neutron-nec-agent ${pkgdir}/usr/bin/neutron-nec-agent
  install -D -m 644 ${srcdir}/neutron-plugin-nec-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-nec-agent.service
}

package_neutron-plugin-nuage-kilo() {
  pkgdesc+=" - Nuage plugin"
  depends=('neutron-kilo')
  backup=('etc/neutron/plugins/nuage/nuage_plugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/nuage/nuage_plugin.ini ${pkgdir}/etc/neutron/plugins/nuage/nuage_plugin.ini
}

package_neutron-plugin-oneconvergence-kilo() {
  pkgdesc+=" - One Convergence plugin"
  depends=('neutron-kilo')
  conflics=('neutron-plugin-oneconvergence')
  backup=('etc/neutron/plugins/oneconvergence/nvsdplugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/oneconvergence/nvsdplugin.ini ${pkgdir}/etc/neutron/plugins/oneconvergence/nvsdplugin.ini
}

package_neutron-plugin-oneconvergence-agent-kilo() {
  pkgdesc+=" - One Convergence plugin agent"
  depends=('neutron-plugin-oneconvergence-kilo')
  conflics=('neutron-plugin-oneconvergence-agent')

  cd tmp
  install -D -m 755 usr/bin/neutron-nvsd-agent ${pkgdir}/usr/bin/neutron-nvsd-agent
  install -D -m 644 ${srcdir}/neutron-plugin-oneconvergence-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-oneconvergence-agent.service
}

package_neutron-plugin-opencontrail-kilo() {
  pkgdesc+=" - OpenContrail plugin"
  depends=('neutron-kilo')
  conflics=('neutron-plugin-opencontrail')
  backup=('etc/neutron/plugins/opencontrail/contrailplugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/opencontrail/contrailplugin.ini ${pkgdir}/etc/neutron/plugins/opencontrail/contrailplugin.ini
}

package_neutron-plugin-openvswitch-kilo() {
  pkgdesc+=" - Open vSwitch plugin"
  install=neutron.plugin.openvswitch.install
  depends=('neutron-kilo')
  conflics=('quantum-plugin-openvswitch'
            'neutron-plugin-openvswitch'
            'neutron-plugin-openvswitch-icehouse')
  backup=('etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini ${pkgdir}/etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini
}

package_neutron-plugin-openvswitch-agent-kilo() {
  pkgdesc+=" - Open vSwitch plugin agent"
  depends=('openvswitch'
           'neutron-kilo'
           'neutron-plugin-openvswitch-kilo')
  conflics=('quantum-plugin-openvswitch-agent'
            'neutron-plugin-openvswitch-agent'
            'neutron-plugin-openvswitch-agent-icehouse')
  cd tmp
  install -D -m 644 etc/neutron/rootwrap.d/openvswitch-plugin.filters ${pkgdir}/etc/neutron/rootwrap.d/openvswitch-plugin.filters
  install -D -m 755 usr/bin/neutron-openvswitch-agent ${pkgdir}/usr/bin/neutron-openvswitch-agent
  install -D -m 644 ${srcdir}/neutron-plugin-openvswitch-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-openvswitch-agent.service
}

package_neutron-plugin-ovsvapp-kilo() {
  pkgdesc+=" - OVSvApp plugin"
  depends=('neutron-kilo')
  backup=('etc/neutron/plugins/ovsvapp/ovsvapp_agent.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/ovsvapp/ovsvapp_agent.ini ${pkgdir}/etc/neutron/plugins/ovsvapp/ovsvapp_agent.ini
}

package_neutron-plugin-ovsvapp-agent-kilo() {
  pkgdesc+=" - OVSvApp plugin agent"
  depends=('neutron-plugin-ovsvapp-kilo')

  cd tmp
  install -D -m 755 usr/bin/neutron-ovsvapp-agent ${pkgdir}/usr/bin/neutron-ovsvapp-agent
}

package_neutron-plugin-plumgrid-kilo() {
  pkgdesc+=" - PLUMgrid plugin"
  depends=('neutron-kilo')
  conflics=('quantum-plugin-plumgrid'
            'neutron-plugin-plumgrid'
            'neutron-plugin-plumgrid-icehouse')
  backup=('etc/neutron/plugins/plumgrid/plumgrid.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/plumgrid/plumgrid.ini ${pkgdir}/etc/neutron/plugins/plumgrid/plumgrid.ini
}

package_neutron-plugin-vmware-kilo() {
  pkgdesc+=" - VMware plugin"
  depends=('neutron-kilo')
  conflics=('neutron-plugin-vmware')
  backup=('etc/neutron/plugins/vmware/nsx.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/vmware/nsx.ini ${pkgdir}/etc/neutron/plugins/vmware/nsx.ini
}

package_neutron-plugin-sriovnic-agent-kilo() {
  pkgdesc+=" - SR-IOV plugin agent"
  depends=('neutron-kilo')

  cd tmp
  install -D -m 755 usr/bin/neutron-sriov-nic-agent ${pkgdir}/usr/bin/neutron-sriov-nic-agent
}

